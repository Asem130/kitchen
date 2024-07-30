class SliderObject {
  String title;
  String supTitle;
  String image;
  SliderObject(this.title, this.supTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

class Customer {
  String id;
  String name;
  int numOfNotif;
  Customer(this.id, this.name, this.numOfNotif);
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Contacts? contactes;
  Customer? customer;
  Authentication(this.customer, this.contactes);
}
