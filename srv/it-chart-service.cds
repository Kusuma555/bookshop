using { com.sap.apimgmt.analytics.chartservice as chartservice } from '../db/entity-data-model';
service ChartService {
  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity UserDashboard as projection on chartservice.UserDashboard;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity UserDashboardChart as projection on chartservice.UserDashboardChart;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity ChartDimension as projection on chartservice.ChartDimension;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity ChartType as projection on chartservice.ChartType;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity ChartMeasure as projection on chartservice.ChartMeasure;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity MeasureCode as projection on chartservice.MeasureCode;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity DimensionCode as projection on chartservice.DimensionCode;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity Chart as projection on chartservice.Chart;

  @Capabilities: { Insertable:true, Updatable:true, Deletable:true}
  entity KPI as projection on chartservice.KPI;

}
