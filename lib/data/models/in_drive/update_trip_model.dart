
class UpdateTripModel {
  int? id;
  String? fare;
  int? driverId;
  String? state;

  UpdateTripModel({
    this.id,
    this.fare,
    this.driverId,
    this.state,
  });

  UpdateTripModel copyWith({
    int? id,
    String? fare,
    int? driverId,
    String? state,
  }) {
    return UpdateTripModel(
      id: id ?? this.id,
      fare: fare ?? this.fare,
      driverId: driverId ?? this.driverId,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      if(fare!=null)'fare': fare,
      if(driverId!=null) 'driver': driverId,
      if(state!=null) 'state': state,
    };
  }

  @override
  bool operator ==(covariant UpdateTripModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.fare == fare && other.driverId == driverId && other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^ fare.hashCode ^ driverId.hashCode ^ state.hashCode;
  }
}
