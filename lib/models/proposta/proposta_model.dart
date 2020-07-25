class Proposta {
  String email;
  String telefone;
  String cpf;
  String ramo;
  String data;
  double taxaCreditoConcorrente;
  double descontoCreditoConcorrente;
  double taxaDebitoConcorrente;
  double descontoDebitoConcorrente;
  double taxaCredito;
  double descontoCredito;
  double taxaDebito;
  double descontoDebito;

  Proposta(
      {this.email,
      this.telefone,
      this.cpf,
      this.ramo,
      this.data,
      this.taxaCreditoConcorrente,
      this.descontoCreditoConcorrente,
      this.taxaDebitoConcorrente,
      this.descontoDebitoConcorrente,
      this.taxaCredito,
      this.descontoCredito,
      this.taxaDebito,
      this.descontoDebito});

  Proposta.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    telefone = json['telefone'];
    cpf = json['cpf'];
    ramo = json['ramo'];
    data = json['data'];
    taxaCreditoConcorrente = json['taxaCreditoConcorrente'];
    descontoCreditoConcorrente = json['descontoCreditoConcorrente'];
    taxaDebitoConcorrente = json['taxaDebitoConcorrente'];
    descontoDebitoConcorrente = json['descontoDebitoConcorrente'];
    taxaCredito = json['taxaCredito'];
    descontoCredito = json['descontoCredito'];
    taxaDebito = json['taxaDebito'];
    descontoDebito = json['descontoDebito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['cpf'] = this.cpf;
    data['ramo'] = this.ramo;
    data['data'] = this.data;
    data['taxaCreditoConcorrente'] = this.taxaCreditoConcorrente;
    data['descontoCreditoConcorrente'] = this.descontoCreditoConcorrente;
    data['taxaDebitoConcorrente'] = this.taxaDebitoConcorrente;
    data['descontoDebitoConcorrente'] = this.descontoDebitoConcorrente;
    data['taxaCredito'] = this.taxaCredito;
    data['descontoCredito'] = this.descontoCredito;
    data['taxaDebito'] = this.taxaDebito;
    data['descontoDebito'] = this.descontoDebito;
    return data;
  }
}
