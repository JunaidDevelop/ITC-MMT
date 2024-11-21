table 60002 "Student Payment Plans_ITC"

{
    DataClassification = ToBeClassified;
    LookupPageId = "Student Payment Plans_ITC";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; "Student ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Student Enrollment Table_ITC";
            Editable = false;



        }
        field(3; "Course"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;

        }
        field(4; "Installment"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "1st","2nd","3rd","4th","5th","6th";

        }
        field(5; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Notification"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Disc. Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                StdenrPlan_lrec: Record "Student Enrollment Table_ITC";
            begin
                StdenrPlan_lrec.Reset();
                StdenrPlan_lrec.Get("Student ID");
                Percentage := StdenrPlan_lrec."Discount %";
                "Base Amount" := Amount / (100 - StdenrPlan_lrec."Discount %") * 100;
            end;
        }
        field(9; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Open,Close,Freeze;
        }
        field(10; "Invoiced"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Pmt. Record"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Base Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Student ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Student ID", Course, Installment, "Disc. Percentage", Amount) { }
    }

    var
        myInt: Integer;
        StdEnrollmentTable: Record "Student Enrollment Table_ITC";

    trigger OnInsert()
    begin
        // Rec."Disc." := EvaluateDecimal(Rec."Percentage");
    end;

    trigger OnModify()
    begin
        // Rec."Disc." := EvaluateDecimal(Rec."Percentage");
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        // Rec."Disc." := EvaluateDecimal(Rec."Percentage");
    end;
}