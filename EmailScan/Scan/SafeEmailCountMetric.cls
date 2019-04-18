Class Scan.SafeEmailCountMetric Extends Ens.BusinessMetric [ ClassType = "", ProcedureBlock ]
{

Property SafeEmails As Ens.DataType.Metric(RANGELOWER = 0, RANGEUPPER = 50, UNITS = "Safe Emails");

Property LastFile As Ens.DataType.Metric(RANGELOWER = -1, RANGEUPPER = 1);

Method OnCalculateMetrics() As %Status
{

	//Determine how many emails went to SafeEmail.txt
	&sql(SELECT COUNT(*) INTO :count
		 FROM Scan.EmailFileRequest
		 WHERE FileName='SafeEmail.txt')

	//Set the metric to the current count of emails to SafeEmail.txt
	Set ..SafeEmails = count
	
	//Determine the name of the file the last email was written to
	
	&sql(SELECT TOP 1 FileName INTO :fn
		 FROM Scan.EmailFileRequest
		 ORDER BY ID DESC)

	//Set the metric to 1 for a smile and -1 for a frown
	If fn="SafeEmail.txt" {
		set ..LastFile = 1}
	Else {set ..LastFile = -1}
	
	Quit $$$OK
}

}
