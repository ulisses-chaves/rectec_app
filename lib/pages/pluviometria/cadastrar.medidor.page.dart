import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/user.bloc.dart';
import 'package:rectec_app/pages/pluviometria/menu.bar.dart' as menu_pluviometria;

class CadastrarMedidorPage extends StatefulWidget {
  const CadastrarMedidorPage({super.key});

  @override
  State<CadastrarMedidorPage> createState() => _CadastrarMedidorPageState();
}

class _CadastrarMedidorPageState extends State<CadastrarMedidorPage> {
  static const _perfis = <String>['Administrador', 'Registrador'];
  static const _profissoes = <String>[
    'Professor',
    'Aluno',
    'Engenheiro',
    'Agricultor',
    'Outro',
  ];

  static final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  static final _cpfRegex = RegExp(r'^\d{11}$');

  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  String _perfilSelecionado = _perfis.first;
  String _profissaoSelecionada = _profissoes.first;
  bool _senhaVisivel = false;
  bool _confirmacaoVisivel = false;
  bool _cadastrando = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _enderecoController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  String? _validarNome(String? valor) {
    final nome = (valor ?? '').trim();
    if (nome.isEmpty) return 'Preencha esse campo';
    if (nome.split(RegExp(r'\s+')).length < 2) {
      return 'Informe nome e sobrenome';
    }
    return null;
  }

  String? _validarCpf(String? valor) {
    final cpf = (valor ?? '').trim();
    if (cpf.isEmpty) return 'Preencha esse campo';
    if (!_cpfRegex.hasMatch(cpf)) {
      return 'CPF deve conter 11 dígitos numéricos';
    }
    return null;
  }

  String? _validarEmail(String? valor) {
    final email = (valor ?? '').trim();
    if (email.isEmpty) return 'Preencha esse campo';
    if (!_emailRegex.hasMatch(email)) return 'Email inválido';
    return null;
  }

  String? _validarObrigatorio(String? valor) {
    if ((valor ?? '').trim().isEmpty) return 'Preencha esse campo';
    return null;
  }

  String? _validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Preencha esse campo';
    if (valor.length < 5) return 'A senha deve ter pelo menos 5 caracteres';
    return null;
  }

  String? _validarConfirmacao(String? valor) {
    if (valor == null || valor.isEmpty) return 'Preencha esse campo';
    if (valor != _senhaController.text) return 'As senhas não estão iguais';
    return null;
  }

  InputDecoration _decoracao(String rotulo, {Widget? sufixo}) {
    return InputDecoration(
      labelText: rotulo,
      suffixIcon: sufixo,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
    );
  }

  void _mostrarMensagem(String mensagem) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(mensagem),
        action: SnackBarAction(
          label: 'OK',
          onPressed: messenger.hideCurrentSnackBar,
        ),
      ),
    );
  }

  Future<void> _cadastrarMedidor() async {
    if (_cadastrando || !(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() => _cadastrando = true);

    try {
      final nome = _nomeController.text.trim().replaceAll(RegExp(r'\s+'), ' ');
      final nomeFormatado = nome[0].toUpperCase() + nome.substring(1);

      final resposta = await Provider.of<UserBloc>(
        context,
        listen: false,
      ).addUsuario(
        nomeFormatado,
        _cpfController.text.trim(),
        _emailController.text.trim(),
        _enderecoController.text.trim(),
        _perfilSelecionado,
        _profissaoSelecionada,
        _senhaController.text,
      );

      if (!mounted) return;
      _mostrarMensagem(resposta.toString());
    } catch (_) {
      if (!mounted) return;
      _mostrarMensagem('Não foi possível realizar o cadastro. Tente novamente.');
    } finally {
      if (mounted) setState(() => _cadastrando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Medidor'),
      ),
      drawer: menu_pluviometria.MenuBar(),
      backgroundColor: Colors.blueGrey.shade50,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: _decoracao('Nome'),
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.name],
                validator: _validarNome,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _cpfController,
                decoration: _decoracao('CPF'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                validator: _validarCpf,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _emailController,
                decoration: _decoracao('Email'),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                validator: _validarEmail,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _enderecoController,
                decoration: _decoracao('Endereço'),
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.fullStreetAddress],
                validator: _validarObrigatorio,
              ),
              const SizedBox(height: 18),
              DropdownButtonFormField<String>(
                value: _perfilSelecionado,
                decoration: _decoracao('Perfil'),
                isExpanded: true,
                items: _perfis
                    .map(
                      (perfil) => DropdownMenuItem(
                        value: perfil,
                        child: Text(perfil),
                      ),
                    )
                    .toList(),
                onChanged: _cadastrando
                    ? null
                    : (valor) {
                        if (valor != null) {
                          setState(() => _perfilSelecionado = valor);
                        }
                      },
              ),
              const SizedBox(height: 18),
              DropdownButtonFormField<String>(
                value: _profissaoSelecionada,
                decoration: _decoracao('Profissão'),
                isExpanded: true,
                items: _profissoes
                    .map(
                      (profissao) => DropdownMenuItem(
                        value: profissao,
                        child: Text(profissao),
                      ),
                    )
                    .toList(),
                onChanged: _cadastrando
                    ? null
                    : (valor) {
                        if (valor != null) {
                          setState(() => _profissaoSelecionada = valor);
                        }
                      },
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _senhaController,
                decoration: _decoracao(
                  'Senha',
                  sufixo: IconButton(
                    tooltip: _senhaVisivel ? 'Ocultar senha' : 'Mostrar senha',
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _senhaVisivel = !_senhaVisivel),
                  ),
                ),
                obscureText: !_senhaVisivel,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.newPassword],
                validator: _validarSenha,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _confirmarSenhaController,
                decoration: _decoracao(
                  'Confirmar Senha',
                  sufixo: IconButton(
                    tooltip: _confirmacaoVisivel
                        ? 'Ocultar confirmação'
                        : 'Mostrar confirmação',
                    icon: Icon(
                      _confirmacaoVisivel
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => setState(
                      () => _confirmacaoVisivel = !_confirmacaoVisivel,
                    ),
                  ),
                ),
                obscureText: !_confirmacaoVisivel,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _cadastrarMedidor(),
                validator: _validarConfirmacao,
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: _cadastrando ? null : _cadastrarMedidor,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _cadastrando
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
