class User {
  final int? id;
  final String nome;
  final int idade;
  final String email;
  final String celular;

  User({
    this.id,
    required this.nome,
    required this.idade,
    required this.email,
    required this.celular,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'email': email,
      'celular': celular,
    };
  }
}
