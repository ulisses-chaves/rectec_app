import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/modelo.bloc.dart';
import 'package:rectec_app/blocs/pluviometria/pluviometro.bloc.dart';
import 'package:rectec_app/pages/pluviometria/menu.bar.dart';

class NovoPluviometroPage extends StatefulWidget {
  const NovoPluviometroPage({super.key});

  @override
  State<NovoPluviometroPage> createState() => _NovoPluviometroPageState();
}

class _NovoPluviometroPageState extends State<NovoPluviometroPage> {
  final _formKey = GlobalKey<FormState>();
  final _formatoData = DateFormat('yyyy-MM-dd');

  DateTime _dataInstalacao = DateTime.now();
  String? _modeloSelecionado;
  String _nome = '';
  String _latitude = '';
  String _longitude = '';
  bool _salvando = false;

  Future<void> _selecionarData() async {
    final dataSelecionada = await showDatePicker(
      context: context,
      initialDate: _dataInstalacao,
      firstDate: DateTime(1940),
      lastDate: DateTime(2099, 12, 31),
      helpText: 'Data de instalação',
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
    );

    if (!mounted || dataSelecionada == null) return;

    setState(() => _dataInstalacao = dataSelecionada);
  }

  String? _validarObrigatorio(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Preencha este campo';
    }
    return null;
  }

  String? _validarCoordenada(
    String? valor, {
    required String nome,
    required double minimo,
    required double maximo,
  }) {
    final texto = valor?.trim() ?? '';
    if (texto.isEmpty) return 'Preencha este campo';

    if (texto.contains(',') || texto.contains(' ')) {
      return 'Use ponto (.) como separador decimal e não utilize espaços';
    }

    final coordenada = double.tryParse(texto);
    if (coordenada == null || !coordenada.isFinite) {
      return '$nome inválida. Digite um número válido';
    }

    if (coordenada < minimo || coordenada > maximo) {
      return '$nome deve estar entre $minimo e $maximo';
    }

    return null;
  }

  void _mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(mensagem),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );
  }

  Future<void> _salvar(String? modeloAtual) async {
    if (_salvando) return;

    final formularioValido = _formKey.currentState?.validate() ?? false;
    if (!formularioValido) return;

    if (modeloAtual == null) {
      _mostrarMensagem('Selecione um modelo de pluviômetro.');
      return;
    }

    _formKey.currentState!.save();
    setState(() => _salvando = true);

    try {
      final bloc = context.read<PluviometroBloc>();
      final resposta = await bloc.addPluviometro(
        _nome,
        _formatoData.format(_dataInstalacao),
        modeloAtual,
        _latitude,
        _longitude,
        context,
      );

      if (!mounted) return;
      _mostrarMensagem(resposta?.toString() ?? 'Operação concluída.');
    } catch (erro) {
      debugPrint('Erro ao cadastrar pluviômetro: $erro');
      if (!mounted) return;
      _mostrarMensagem('Não foi possível salvar o pluviômetro. Tente novamente.');
    } finally {
      if (mounted) setState(() => _salvando = false);
    }
  }

  Widget _campoCoordenada({
    required String titulo,
    required double minimo,
    required double maximo,
    required ValueChanged<String> aoSalvar,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: titulo,
        hintText: 'Ex.: -8.0476',
        border: const OutlineInputBorder(),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      textInputAction: TextInputAction.next,
      enabled: !_salvando,
      validator: (valor) => _validarCoordenada(
        valor,
        nome: titulo,
        minimo: minimo,
        maximo: maximo,
      ),
      onSaved: (valor) => aoSalvar(valor?.trim() ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    // O catálogo já é mantido pelo provider: não é necessário FutureBuilder.
    final modelos = context
        .watch<ModeloBloc>()
        .modelos
        .map((modelo) => modelo.tipo)
        .where((tipo) => tipo.trim().isNotEmpty)
        .toSet()
        .toList();

    // Evita erros caso o modelo anterior não exista mais no catálogo.
    final modeloAtual = modelos.contains(_modeloSelecionado)
        ? _modeloSelecionado
        : (modelos.isNotEmpty ? modelos.first : null);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Pluviômetro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MenuBar(),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    enabled: !_salvando,
                    validator: _validarObrigatorio,
                    onSaved: (valor) => _nome = valor?.trim() ?? '',
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: _salvando ? null : _selecionarData,
                    borderRadius: BorderRadius.circular(4),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Data de instalação',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today_outlined),
                      ),
                      child: Text(_formatoData.format(_dataInstalacao)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Modelo',
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isDense: true,
                        isExpanded: true,
                        value: modeloAtual,
                        hint: const Text('Selecione um modelo'),
                        onChanged: _salvando || modelos.isEmpty
                            ? null
                            : (valor) => setState(() => _modeloSelecionado = valor),
                        items: modelos
                            .map(
                              (modelo) => DropdownMenuItem<String>(
                                value: modelo,
                                child: Text(
                                  modelo,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  if (modelos.isEmpty) ...[
                    const SizedBox(height: 8),
                    const Text(
                      'Nenhum modelo disponível. Cadastre um modelo antes de continuar.',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                  const SizedBox(height: 20),
                  _campoCoordenada(
                    titulo: 'Latitude',
                    minimo: -90,
                    maximo: 90,
                    aoSalvar: (valor) => _latitude = valor,
                  ),
                  const SizedBox(height: 20),
                  _campoCoordenada(
                    titulo: 'Longitude',
                    minimo: -180,
                    maximo: 180,
                    aoSalvar: (valor) => _longitude = valor,
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _salvando || modeloAtual == null
                          ? null
                          : () => _salvar(modeloAtual),
                      child: _salvando
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
