class Proposta {
  String sId;
  String email;
  String telefone;
  String cpf;
  String ramo;
  String data;
  String concorrente;
  double taxaCreditoConcorrente;
  double descontoCreditoConcorrente;
  double taxaDebitoConcorrente;
  double descontoDebitoConcorrente;
  double taxaCredito;
  double descontoCredito;
  double taxaDebito;
  double descontoDebito;
  int iV;

  Proposta(
      {this.sId,
      this.email,
      this.telefone,
      this.cpf,
      this.ramo,
      this.data,
      this.concorrente,
      this.taxaCreditoConcorrente,
      this.descontoCreditoConcorrente,
      this.taxaDebitoConcorrente,
      this.descontoDebitoConcorrente,
      this.taxaCredito,
      this.descontoCredito,
      this.taxaDebito,
      this.descontoDebito,
      this.iV});

  Proposta.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    telefone = json['telefone'];
    cpf = json['cpf'];
    ramo = json['ramo'];
    data = json['data'];
    concorrente = json['concorrente'];
    taxaCreditoConcorrente = json['taxaCreditoConcorrente']?.toDouble();
    descontoCreditoConcorrente = json['descontoCreditoConcorrente']?.toDouble();
    taxaDebitoConcorrente = json['taxaDebitoConcorrente']?.toDouble();
    descontoDebitoConcorrente = json['descontoDebitoConcorrente']?.toDouble();
    taxaCredito = json['taxaCredito']?.toDouble();
    descontoCredito = json['descontoCredito']?.toDouble();
    taxaDebito = json['taxaDebito']?.toDouble();
    descontoDebito = json['descontoDebito']?.toDouble();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['cpf'] = this.cpf;
    data['ramo'] = this.ramo;
    data['data'] = this.data;
    data['concorrente'] = this.concorrente;
    data['taxaCreditoConcorrente'] = this.taxaCreditoConcorrente;
    data['descontoCreditoConcorrente'] = this.descontoCreditoConcorrente;
    data['taxaDebitoConcorrente'] = this.taxaDebitoConcorrente;
    data['descontoDebitoConcorrente'] = this.descontoDebitoConcorrente;
    data['taxaCredito'] = this.taxaCredito;
    data['descontoCredito'] = this.descontoCredito;
    data['taxaDebito'] = this.taxaDebito;
    data['descontoDebito'] = this.descontoDebito;
    data['__v'] = this.iV;
    return data;
  }

  clear() {
    sId = null;
    email = null;
    telefone = null;
    cpf = null;
    ramo = null;
    data = null;
    concorrente = null;
    taxaCreditoConcorrente = null;
    descontoCreditoConcorrente = null;
    taxaDebitoConcorrente = null;
    descontoDebitoConcorrente = null;
    taxaCredito = null;
    descontoCredito = null;
    taxaDebito = null;
    descontoDebito = null;
    iV = null;
  }
}
