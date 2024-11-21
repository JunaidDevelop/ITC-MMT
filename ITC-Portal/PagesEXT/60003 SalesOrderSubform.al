pageextension 60003 SaleOrderSubFormExtension extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(Installment_ITC; Rec.Installment_ITC)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {

    }
    var
        myInt: Integer;
}