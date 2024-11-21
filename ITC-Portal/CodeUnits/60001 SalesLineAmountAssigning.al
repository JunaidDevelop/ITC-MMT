codeunit 60001 "AssignAmountToSalesLines"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        EnrolledStd: Record "Student Payment Plans_ITC";
        CustomerID: Code[20];
        AmountValue: Decimal;
    begin
        // Set the customer ID and amount value
        CustomerID := '10000';
        AmountValue := EnrolledStd.Amount; // Example amount value

        // Find the sales order header for the specific customer
        if SalesHeader.Get(SalesHeader."Document Type"::Order, CustomerID) then begin
            // Loop through the sales lines and assign the amount value
            if SalesLine.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
                repeat
                    SalesLine.Validate(Amount, AmountValue);
                    SalesLine.Modify();
                until SalesLine.Next() = 0;
            end;
        end else begin
            Message('Sales order for customer ID %1 not found.', CustomerID);
        end;
    end;
}
