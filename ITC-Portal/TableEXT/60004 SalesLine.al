tableextension 60004 "SalesLine EXT" extends "Sales Line"
{
    fields
    {
        field(60001; "Installment_ITC"; Option)
        {
            Caption = 'Installment';
            DataClassification = ToBeClassified;
            OptionMembers = "1st","2nd","3rd","4th","5th","6th";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}