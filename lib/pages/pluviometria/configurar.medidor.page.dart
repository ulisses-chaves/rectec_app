import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rectec_app/blocs/pluviometria/pluviometro.bloc.dart';
import 'package:rectec_app/blocs/pluviometria/user.bloc.dart';
import 'package:rectec_app/models/pluviometria/pluviometro.model.dart';
import 'package:rectec_app/models/pluviometria/user.model.dart';
import 'package:rectec_app/pages/pluviometria/menu.bar.dart';

/// Associa um usuário a um pluviômetro.
///
/// [onCadastrar] é opcional para preservar a criação da página com
/// `ConfigurarMedidorPage()`. Como o código original não implementava a ação
/// do botão, a persistência deve ser fornecida por quem utiliza a página.
class ConfigurarMedidorPage extends StatefulWidget {
  const ConfigurarMedidorPage({
    super.key,
    this.onCadastrar,
  });

  final Future<void> Function(User usuario, Pluviometro pluviometro)?
      onCadastrar;

  @override
  State<ConfigurarMedidorPage> createState() => _ConfigurarMedidorPageState();
}

class _ConfigurarMedidorPageState extends State<ConfigurarMedidorPage> {
  User? _usuarioSelecionado;
  Pluviometro? _pluviometroSelecionado;
  bool _exibirErros = false;
  bool _salvando = false;

  @override
  Widget build(BuildContext context) {
    // Os dados já são listas disponíveis nos blocs: não precisam de FutureBuilder.
    // watch reconstrói a tela caso os providers notifiquem alterações.
    final usuarios = context
        .watch<UserBloc>()
        .usuarios
        .where((usuario) => usuario.idPerfil != 1)
        .toList(growable: false);

    final pluviometros = context
        .watch<PluviometroBloc>()
        .pluviometros
        .toList(growable: false);

    // Evita assumir que opções fixas existem na lista. Também descarta
    // visualmente seleções cujos objetos foram removidos ou recarregados.
    final indiceUsuario = _indiceDaSelecao(usuarios, _usuarioSelecionado);
    final indicePluviometro =
        _indiceDaSelecao(pluviometros, _pluviometroSelecionado);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurar Medidor',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      drawer: MenuBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
          children: [
            Text(
              'Usuários e Pluviômetros',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            _CampoSelecao<User>(
              titulo: 'Usuário',
              mensagemVazia: 'Nenhum usuário disponível',
              itens: usuarios,
              indiceSelecionado: indiceUsuario,
              descricao: (usuario) => usuario.name,
              habilitado: !_salvando,
              mensagemErro: _exibirErros && indiceUsuario == null
                  ? 'Selecione um usuário.'
                  : null,
              onChanged: (indice) {
                setState(() {
                  _usuarioSelecionado =
                      indice == null ? null : usuarios[indice];
                });
              },
            ),
            const SizedBox(height: 20),
            _CampoSelecao<Pluviometro>(
              titulo: 'Pluviômetro',
              mensagemVazia: 'Nenhum pluviômetro disponível',
              itens: pluviometros,
              indiceSelecionado: indicePluviometro,
              descricao: (pluviometro) => pluviometro.nome,
              habilitado: !_salvando,
              mensagemErro: _exibirErros && indicePluviometro == null
                  ? 'Selecione um pluviômetro.'
                  : null,
              onChanged: (indice) {
                setState(() {
                  _pluviometroSelecionado =
                      indice == null ? null : pluviometros[indice];
                });
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: _salvando
                    ? null
                    : () => _cadastrar(
                          usuarios: usuarios,
                          pluviometros: pluviometros,
                          indiceUsuario: indiceUsuario,
                          indicePluviometro: indicePluviometro,
                        ),
                child: _salvando
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Retorna o índice apenas quando o mesmo objeto continua disponível.
  /// Isso evita ambiguidades entre usuários ou pluviômetros de mesmo nome.
  int? _indiceDaSelecao<T>(List<T> itens, T? selecionado) {
    if (selecionado == null) return null;

    final indice = itens.indexWhere((item) => identical(item, selecionado));
    return indice == -1 ? null : indice;
  }

  Future<void> _cadastrar({
    required List<User> usuarios,
    required List<Pluviometro> pluviometros,
    required int? indiceUsuario,
    required int? indicePluviometro,
  }) async {
    if (indiceUsuario == null || indicePluviometro == null) {
      setState(() => _exibirErros = true);
      return;
    }

    final cadastrar = widget.onCadastrar;
    if (cadastrar == null) {
      _mostrarMensagem(
        'O cadastro ainda não foi implementado. '
        'Conecte a ação onCadastrar à rotina de persistência.',
      );
      return;
    }

    setState(() => _salvando = true);

    try {
      await cadastrar(
        usuarios[indiceUsuario],
        pluviometros[indicePluviometro],
      );

      if (!mounted) return;
      _mostrarMensagem('Configuração cadastrada com sucesso.');
    } catch (erro) {
      debugPrint('Falha ao cadastrar configuração do medidor: $erro');
      if (!mounted) return;
      _mostrarMensagem('Não foi possível cadastrar a configuração.');
    } finally {
      if (mounted) {
        setState(() => _salvando = false);
      }
    }
  }

  void _mostrarMensagem(String mensagem) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(content: Text(mensagem)));
  }
}

/// Dropdown reutilizável que usa índices para não confundir opções homônimas.
class _CampoSelecao<T> extends StatelessWidget {
  const _CampoSelecao({
    required this.titulo,
    required this.mensagemVazia,
    required this.itens,
    required this.indiceSelecionado,
    required this.descricao,
    required this.habilitado,
    required this.onChanged,
    this.mensagemErro,
  });

  final String titulo;
  final String mensagemVazia;
  final List<T> itens;
  final int? indiceSelecionado;
  final String Function(T item) descricao;
  final bool habilitado;
  final ValueChanged<int?> onChanged;
  final String? mensagemErro;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: titulo,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        errorText: mensagemErro,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: indiceSelecionado,
          isExpanded: true,
          hint: Text(itens.isEmpty ? mensagemVazia : 'Selecione $titulo'),
          items: [
            for (var indice = 0; indice < itens.length; indice++)
              DropdownMenuItem<int>(
                value: indice,
                child: Text(
                  descricao(itens[indice]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
          onChanged: habilitado && itens.isNotEmpty ? onChanged : null,
        ),
      ),
    );
  }
}
