import '../database.dart';

class AvaliacoesTable extends SupabaseTable<AvaliacoesRow> {
  @override
  String get tableName => 'avaliacoes';

  @override
  AvaliacoesRow createRow(Map<String, dynamic> data) => AvaliacoesRow(data);
}

class AvaliacoesRow extends SupabaseDataRow {
  AvaliacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvaliacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get coletaId => getField<int>('coleta_id');
  set coletaId(int? value) => setField<int>('coleta_id', value);

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  String? get coletorId => getField<String>('coletor_id');
  set coletorId(String? value) => setField<String>('coletor_id', value);

  int? get avaliacaoColetor => getField<int>('avaliacao_coletor');
  set avaliacaoColetor(int? value) => setField<int>('avaliacao_coletor', value);

  int? get avaliacaoUsuario => getField<int>('avaliacao_usuario');
  set avaliacaoUsuario(int? value) => setField<int>('avaliacao_usuario', value);
}
