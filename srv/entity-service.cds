using { com.sap.apimgmt.analytics.developer as developer } from '../db/entity-schema.cds';

service DeveloperService {
  @Capabilities: { Insertable:true, Updatable:true, Deletable:true, Readable:true}
  entity Developers as projection on developer.Developer;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true, Readable:true}
  entity Applications as projection on developer.Application;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true, Readable:true}
  entity Products as projection on developer.Product;
}

