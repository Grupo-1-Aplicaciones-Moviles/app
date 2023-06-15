class hiredService{
  final String customer_id;
  final String service_id;
  final String status;

  hiredService({
    required this.status,
    required this.service_id,
    required this.customer_id
  });

  Map<String, dynamic> toJson() =>{
    'customer_id': customer_id,
    'service_id': service_id,
    'status': status
  };
}