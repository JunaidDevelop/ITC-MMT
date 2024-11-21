tableextension 60003 "Customer EXT" extends Customer
{
    fields
    {
        field(60001; "Student CNIC No_ITC"; Code[20])
        {
            Caption = 'Student CNIC No';
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