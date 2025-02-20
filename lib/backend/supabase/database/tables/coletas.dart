import '../database.dart';

class ColetasTable extends SupabaseTable<ColetasRow> {
  @override
  String get tableName => 'coletas';

  @override
  ColetasRow createRow(Map<String, dynamic> data) => ColetasRow(data);
}

class ColetasRow extends SupabaseDataRow {
  ColetasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColetasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  String? get coletorId => getField<String>('coletor_id');
  set coletorId(String? value) => setField<String>('coletor_id', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get avaliacaoColetor => getField<int>('avaliacao_coletor');
  set avaliacaoColetor(int? value) => setField<int>('avaliacao_coletor', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get avaliacaoUsuario => getField<int>('avaliacao_usuario');
  set avaliacaoUsuario(int? value) => setField<int>('avaliacao_usuario', value);

  DateTime? get dataColeta => getField<DateTime>('data_coleta');
  set dataColeta(DateTime? value) => setField<DateTime>('data_coleta', value);
}
