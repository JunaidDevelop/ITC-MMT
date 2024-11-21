pageextension 60002 "Employee List Extension" extends "Employee List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Ledger E&ntries")
        {
            action("Active Employee")
            {

                trigger OnAction()
                var
                    EmployeePage: Record "Employee";
                begin
                    EmployeePage.SetRange(EmployeePage.Status, EmployeePage.Status::Active);
                    Page.Run(Page::"Active Employees_ITC", EmployeePage);
                end;
            }
        }
        addlast(Category_Process)
        {
            actionref("Active Employee_Promoted"; "Active Employee")
            {
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}