namespace com.sap.apimgmt.analytics.chartservice;

aspect AnalyticsDataView {
    key id : String(36);             // Corresponds to 'id' in Java entity (UUID)
    version : String(10);            // Corresponds to 'version' in Java entity, limited to 10 characters
    name : String(255);              // Corresponds to 'name' in Java entity, unique and not nullable
    title : String(255);             // Corresponds to 'title' in Java entity
    description : String(1000);      // Corresponds to 'description' in Java entity, max 1000 characters
}

entity UserDashboard : AnalyticsDataView {
    position : Integer;
    type : String(10);
    runtimeType : String(20);
    charts : Association to many UserDashboardChart on charts.userDashboard=$self;
}

entity UserDashboardChart {
    key userDashboardId : UUID;    // Part of composite key, corresponds to UserDashboardChartId.userDashboardId
    key chartId: String(36);
    userDashboard : Association to UserDashboard on userDashboard.id = $self.userDashboardId; // Foreign key linking UserDashboardChart to UserDashboard
    chart : Association to Chart on chart.id = $self.chartId;  // Represents the relationship to the Chart entity
    runtimeType : String(20);     // Corresponds to 'runtimeType' in Java entity as an enumerated string of max 20 characters
    position : Integer;           // Corresponds to 'position' in Java entity
    visibility : Boolean;         // Corresponds to 'visibility' in Java entity, with default as 'true'
}

entity Chart : AnalyticsDataView {
    type : String(10);            // Corresponds to 'type' in Java entity, limited to 10 characters and not nullable
    timeSeries : Boolean;         // Corresponds to 'timeSeries' in Java entity
    filterExpression : String(1000); // Corresponds to 'filterExpression' in Java entity, max 1000 characters
    orderExpression : String(1000);  // Corresponds to 'orderExpression' in Java entity, max 1000 characters
    pageExpression : String(1000);   // Corresponds to 'pageExpression' in Java entity, max 1000 characters
    runtimeType : String(20);        // Corresponds to 'runtimeType' in Java entity, as an enumerated string of max 20 characters
    chartType : Association to ChartType; // Corresponds to 'chartType' relationship in Java entity
    chartMeasures : Association to many ChartMeasure on chartMeasures.chart = $self;
    chartDimensions : Association to many ChartDimension on chartDimensions.chart = $self;
    userDashboard : Association to many UserDashboardChart on userDashboard.chart = $self;
}

entity ChartDimension {
   // key ID : UUID;                 // Primary Key for ChartDimension (could be auto-generated)
    //dimensionName : String(40);    // Corresponds to 'dimensionName' in Java entity
    chart : Association to Chart;   // Foreign key linking ChartDimension to Chart
    dimensionCode : Association to DimensionCode; // Association to DimensionCode
}

entity ChartType {
    key code : String(2);           // Primary Key for ChartType corresponding to 'code' in Java entity
    name : String;                  // Corresponds to 'name' in Java entity
    icon : String;                  // Corresponds to 'icon' in Java entity
    thumbnail : String;             // Corresponds to 'thumbnail' in Java entity
}

entity ChartMeasure {
    //key ID : UUID;                 // Primary Key for ChartMeasure (could be auto-generated)
    //measureName : String(40);      // Corresponds to 'measureName' in Java entity
    key chart : Association to Chart ;  // Foreign key linking ChartMeasure to Chart
    key measureCode : Association to MeasureCode;
}

entity MeasureCode {
    key CODE : String(40);         // Part of composite key for MeasureCode corresponding to 'code' in Java entity
    key AGGREGATION : String(10);  // Part of composite key for MeasureCode corresponding to 'aggregation' in Java entity
    description : String(100);     // Optional description of MeasureCode (as in Java entity)
}

entity DimensionCode {
    key CODE : String(40);         // Primary key for DimensionCode corresponding to 'code' in Java entity
    description : String(100);     // Optional description of DimensionCode (as in Java entity)
}

entity History {
    key ID : UUID;
    created_by : String(255);     // Corresponds to 'created_by' in Java entity
    changed_by : String(255);     // Corresponds to 'changed_by' in Java entity
    created_at : Timestamp;       // Corresponds to 'created_at' in Java entity (with Calendar mapping to Timestamp)
    changed_at : Timestamp;       // Corresponds to 'changed_at' in Java entity (with Calendar mapping to Timestamp)
}

entity KPI : AnalyticsDataView {

    runtimeType : String(20);                // Corresponds to runtimeType in Java entity
    positiveTrend : String(10);              // Represents the PositiveTrend enum (INCREASING, DECREASING)
    measureCode : Association to MeasureCode // One-to-One relationship with MeasureCode

}
