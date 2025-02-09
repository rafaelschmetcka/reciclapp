import '../database.dart';

class HistoricoTable extends SupabaseTable<HistoricoRow> {
  @override
  String get tableName => 'historico';

  @override
  HistoricoRow createRow(Map<String, dynamic> data) => HistoricoRow(data);
}

class HistoricoRow extends SupabaseDataRow {
  HistoricoRow(super.data);

  @override
  SupabaseTable get table => HistoricoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  String? get coletorId => getField<String>('coletor_id');
  set coletorId(String? value) => setField<String>('coletor_id', value);

  int? get coletaId => getField<int>('coleta_id');
  set coletaId(int? value) => setField<int>('coleta_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  int? get avaliacaoColetor => getField<int>('avaliacao_coletor');
  set avaliacaoColetor(int? value) => setField<int>('avaliacao_coletor', value);

  int? get avaliacaoUsuario => getField<int>('avaliacao_usuario');
  set avaliacaoUsuario(int? value) => setField<int>('avaliacao_usuario', value);
}
