Class Scan.ChangeForSafeEmailDTL Extends Ens.DataTransformDTL
{

XData DTL
{
<?xml version="1.0" ?>

<transform targetClass='Scan.CheckEmployeeRequest' sourceClass='Scan.CheckEmployeeRequest' create='new' language='objectscript'>

<assign property='target.EmailText' value='"Contains gizmo "_source.EmailText' action='set'/>

<assign property='target.ID' value='source.ID' action='set'/>

<assign property='target.Name' value='source.Name' action='set'/>

<assign property='target.ToAddress' value='$piece(source.ToAddress,"@",2)' action='set'/>

</transform>
}

}
