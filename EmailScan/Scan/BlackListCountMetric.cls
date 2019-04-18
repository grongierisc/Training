Class Scan.BlackListCountMetric Extends Ens.BusinessMetric [ ClassType = "", ProcedureBlock ]
{

Property BlackListEmails As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50, UNITS = "BlackList Emails");

Method OnCalculateMetrics() As %Status
{
	//Determine how many emails went to BlackList.txt
	&sql(SELECT COUNT(*) INTO :count
		 FROM Scan.EmailFileRequest
		 WHERE FileName='BlackList.txt')

	//Set the metric to the current count of emails to BlackList.txt
	Set ..BlackListEmails = count
	
	Quit $$$OK
}

}
