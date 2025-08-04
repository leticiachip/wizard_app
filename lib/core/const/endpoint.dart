enum Rota{
  dev('https://api-driverlog.chiptronicsciencetelematic.com.br/dev'),
  producao('https://api-driverlog.chiptronicsciencetelematic.com.br/v2');
  final String valor;
  const Rota(this.valor);
}

Rota url = Rota.producao;