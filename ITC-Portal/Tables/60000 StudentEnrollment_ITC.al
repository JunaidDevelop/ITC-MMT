table 60000 "Student Enrollment Table_ITC"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Student Enrollment_ITC";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Student ID';
            DataClassification = ToBeClassified;
        }
        field(2; Batch; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "BATCH-01","BATCH-02","BATCH-03","BATCH-04","BATCH-05","BATCH-06","BATCH-07","BATCH-08","BATCH-09","BATCH-10";

        }
        field(3; CourseName; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "APP DEVELOPMENT","FRONT-END DEVELOPMENT","GRAPHICS DESIGNING","DOT NET DEVELOPMENT","SHOPIFY DROPSHIPPING","WORDPRESS DEVELOPMENT","FULL STACK WEB DEVELOPMENT","SOCIAL MEDIA MARKETING","BACK-END DEVELOPMENT","OFFICE MANAGEMENT","VIDEO EDITING";
        }
        field(4; TrainingShift; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "11:00am to 12:00pm","12:00pm to 3:00pm","3:00pm to 6:00pm";

        }
        field(5; Prefix; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Mr.","Mrs","Miss";

        }
        field(6; FirstName; Text[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Clear(Rec."Full Name_ITC");
                if Rec.FirstName <> '' then begin
                    if Rec.LastName <> '' then
                        Rec."Full Name_ITC" := Rec.FirstName + ' ' + Rec.LastName
                    else
                        Rec."Full Name_ITC" := Rec.FirstName;
                end
                else begin
                    if Rec.LastName <> '' then
                        Rec."Full Name_ITC" := Rec.LastName
                    else
                        Clear(Rec."Full Name_ITC");
                end;

            end;

        }
        field(7; LastName; Text[50])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Clear(Rec."Full Name_ITC");
                if Rec.LastName <> '' then begin
                    if Rec.FirstName <> '' then
                        Rec."Full Name_ITC" := Rec.FirstName + ' ' + Rec.LastName
                    else
                        Rec."Full Name_ITC" := Rec.LastName;
                end
                else begin
                    if Rec.FirstName <> '' then
                        Rec."Full Name_ITC" := Rec.FirstName
                    else
                        Clear(Rec."Full Name_ITC");
                end;

            end;

        }
        field(8; DOB; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(9; MobNo1; Text[20])
        {
            ExtendedDatatype = PhoneNo;
            DataClassification = ToBeClassified;

        }
        field(10; MobNo2; Code[20])
        {
            ExtendedDatatype = PhoneNo;
            DataClassification = ToBeClassified;

        }
        field(11; StudentEmail; Text[30])
        {
            ExtendedDatatype = EMail;
            DataClassification = ToBeClassified;

        }
        field(12; Gender; Option)
        {
            OptionMembers = "Male","Female","Transgender";
            DataClassification = ToBeClassified;

        }
        field(13; Religion; Option)
        {
            OptionMembers = "Muslim","Non-Muslim";
            DataClassification = ToBeClassified;

        }
        field(14; "StudentB-form/CNIC/SmartCard"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(15; RefrenceType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Social Media","Expo Event","Social Media Ads";

        }
        field(16; Refrence; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(17; PlanCreated; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Cust_lrec: Record Customer;
            begin
                if Rec.PlanCreated = true then begin
                    TestField(FirstName);
                    TestField(LastName);
                    TestField("StudentB-form/CNIC/SmartCard");
                    TestField(City);
                    TestField(Address);
                    CreateCust();
                end;
            end;

        }

        //Guardian detail

        field(18; "Father/GuardianName"; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(19; "Father/GuardianMobumber"; Code[30])
        {
            ExtendedDatatype = PhoneNo;
            DataClassification = ToBeClassified;

        }
        field(20; "FatherCNIC/SmartCard"; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(21; Address; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(22; "State/province"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(23; City; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; StreetAddress; Text[100])
        {
            DataClassification = ToBeClassified;

        }


        //Course Detail 

        field(25; TrainingStartDat; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(26; TrainingEndDat; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(27; InternshipIncl; Boolean)
        {
            DataClassification = ToBeClassified;


        }
        field(28; JoinDat; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(29; EndDat; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(30; Result; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Pass,Fail,Freeze,Leave,Terminate;

        }
        field(31; CertIssue; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = No,Yes;

        }
        field(32; StdScore; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(33; PaymentPlans; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Full Name_ITC"; Text[100])
        {
            Caption = 'Full Name';
            DataClassification = ToBeClassified;
        }
        field(35; "Total Course Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Discount %" <> 0 then
                    Amount := "Total Course Fee" - ("Total Course Fee" * "Discount %" / 100)
                else
                    Amount := "Total Course Fee"
            end;
        }
        field(36; "Discount %"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Discount %" <> 0 then
                    Amount := "Total Course Fee" - ("Total Course Fee" * "Discount %" / 100)
                else
                    Amount := "Total Course Fee"
            end;
        }
        field(37; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Discount %" <> 0 then
                    Amount := "Total Course Fee" - ("Total Course Fee" * "Discount %" / 100)
                else
                    Amount := "Total Course Fee"
            end;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", FirstName) { }
        // Add changes to field groups here
    }

    var
        myInt: Integer;


        EnrollmentSeriesNo: Record "Enrollmeent Setup_ITC";
        NoSeries: Codeunit "No. Series";

    trigger OnInsert()

    begin
        EnrollmentSeriesNo.Reset();
        EnrollmentSeriesNo.Get();
        EnrollmentSeriesNo.TestField("NO.Series");
        Rec."No." := NoSeries.GetNextNo(EnrollmentSeriesNo."NO.Series", Today, true);
    end;



    trigger OnModify()
    begin


    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure CreateCust()
    var
        Cust_lrec: Record Customer;
        custTemplate_lrec: Record "Customer Templ.";
    begin
        Cust_lrec.Reset();
        Cust_lrec.SetRange("No.", Rec."No.");
        if not Cust_lrec.FindFirst() then begin
            Cust_lrec.Init();
            Cust_lrec."No." := Rec."No.";
            Cust_lrec.Name := Rec."Full Name_ITC";
            Cust_lrec.City := Rec.City;
            Cust_lrec.Address := Rec.Address;
            Cust_lrec."Student CNIC No_ITC" := Rec."StudentB-form/CNIC/SmartCard";
            custTemplate_lrec.Reset();
            custTemplate_lrec.SetRange(Code, 'CUSTOMER COMPANY');
            if custTemplate_lrec.FindFirst() then begin
                Cust_lrec.Validate("Customer Posting Group", custTemplate_lrec."Customer Posting Group");
                Cust_lrec.Validate("Payment Terms Code", custTemplate_lrec."Payment Terms Code");
                Cust_lrec.Validate("Invoice Disc. Code", custTemplate_lrec."Invoice Disc. Code");
                Cust_lrec.Validate("Customer Disc. Group", custTemplate_lrec."Customer Disc. Group");
                Cust_lrec.Validate("Country/Region Code", custTemplate_lrec."Country/Region Code");
                Cust_lrec.Validate("Payment Method Code", custTemplate_lrec."Payment Method Code");
                Cust_lrec.Validate("Payment Terms Code", custTemplate_lrec."Payment Terms Code");
                Cust_lrec.Validate("Application Method", custTemplate_lrec."Application Method");
                Cust_lrec.Validate("Copy Sell-to Addr. to Qte From", custTemplate_lrec."Copy Sell-to Addr. to Qte From");
                Cust_lrec.Validate("Gen. Bus. Posting Group", custTemplate_lrec."Gen. Bus. Posting Group");
                Cust_lrec.Validate("VAT Bus. Posting Group", custTemplate_lrec."VAT Bus. Posting Group");
                Cust_lrec.Validate("Allow Line Disc.", custTemplate_lrec."Allow Line Disc.");
                Cust_lrec.Validate("Application Method", custTemplate_lrec."Application Method");
                Cust_lrec.Validate(Reserve, custTemplate_lrec.Reserve);
            end;
            Cust_lrec.Insert();
        end;
    end;
}