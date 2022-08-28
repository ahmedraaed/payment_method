abstract class payementState{}

class paymenetInit extends payementState{}

//first token
class paymenetSuccssed extends payementState{}
class paymenetError extends payementState{
  String? error;

  paymenetError({error});
}

//id order
class paymenetOrderIDSuccssed extends payementState{}
class paymenetOrderIDError extends payementState{
  String? error;

  paymenetOrderIDError({error});
}


//final token
class paymenetRequestTokenSuccssed extends payementState{}
class paymenetRequestTokenError extends payementState{
  String? error;

  paymenetRequestTokenError({error});
}



//final kiosk
class paymenetRequestTokenkioskSuccssed extends payementState{}
class paymenetRequestTokenkioskError extends payementState{
  String? error;

  paymenetRequestTokenkioskError({error});
}



//final kiosk
class paymenetRefkioskSuccssed extends payementState{}
class paymenetRefkioskError extends payementState{
  String? error;

  paymenetRefkioskError({error});
}