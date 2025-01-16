namespace com.sap.apimgmt.analytics.developer;


entity Developer {
  key id: UUID;
  firstName: String;
  lastName: String;
}

entity Application {
  key id: UUID;
  name: String;
}

entity Product {
  key id: UUID;
  name: String;
}