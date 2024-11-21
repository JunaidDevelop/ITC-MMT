tableextension 60005 "SalesHaeder EXT" extends "Sales Header"
{
    fields
    {
        field(60001; "Student Source ID_ITC"; Code[20])
        {
            Caption = 'Student Source ID';
            DataClassification = ToBeClassified;
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