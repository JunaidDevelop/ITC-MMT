pageextension 60001 EmployeeCardExtension_JIT extends "Employee Card"
{
    layout
    {
        modify("Bank Account No.")
        {
            Visible = Isvisble;

        }
        modify(IBAN)
        {
            Visible = Isvisble;

        }
        modify("SWIFT Code")
        {
            Visible = Isvisble;

        }
        modify("Bank Branch No.")
        {
            Visible = Isvisble;

        }
        addafter("Last Name")
        {
            field("Father Name"; Rec."Father Name")
            {
                Caption = 'Father Name';
                ApplicationArea = all;
            }
        }
        addafter("Job Title")
        {


            field(EmplSection; Rec.EmplSection)
            {
                ApplicationArea = all;
            }
            field(Department; Rec.Department)
            {
                ApplicationArea = all;
            }
            field("Sub Sections"; Rec."Sub Sections")
            {
                ApplicationArea = all;
            }
            field(EmployeeCNIC; Rec.EmployeeCNIC)
            {
                Caption = 'CNIC';
                ApplicationArea = all;
            }


        }
        addafter("Application Method")
        {
            field("BANK Transfer"; Rec."BANK Transfer")
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    if Rec."BANK Transfer" then begin
                        Rec."Cash" := false;
                        Isvisble := true;
                    end
                    else begin
                        Rec."Cash" := true;
                        Isvisble := false;
                    end;
                    // CurrPage.Update(false);
                end;
            }
            group("Bank")
            {
                ShowCaption = false;
                Visible = Isvisble;
                field(IBANNO; Rec.IBAN)
                {
                    ApplicationArea = All;

                }
                field("Bank_Account_No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;

                }
                field("Bank_Branch_No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = all;
                }
                field("SWIFT_Code"; Rec."SWIFT Code")
                {
                    ApplicationArea = All;
                }
            }

            field(Cash; Rec.Cash)
            {
                ApplicationArea = all;
                trigger OnValidate()
                var


                begin
                    if Rec.Cash = true then begin
                        Rec."BANK Transfer" := false;
                        Isvisble := false;

                    end
                    else begin
                        Rec."BANK Transfer" := true;
                        Isvisble := true;
                    end;

                end;
            }


        }
        addafter("Administration")
        {
            group("Remuneration")
            {
                field("Employee Salary"; Rec."Employee Salary")
                {
                    Caption = 'Salary';

                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        EmployeeRec: Record "Employee";
                    begin
                        if Rec."Employee Salary" > 0 then begin
                            Rec.Reset();
                            Rec."Basic Salary" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 50);
                            Rec."PF Dedducation" := Rec."Basic Salary" / 100 * 10;
                            Rec."House Rent" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 30);
                            Rec."Medical Allowance" := ((Rec."Employee Salary" - (Rec."S.A.A" + Rec."CLA")) / 100 * 20);
                            Rec."Gross Salary" := ((((Rec."Basic Salary" + Rec."House Rent") + Rec."Medical Allowance") + Rec."S.A.A") + Rec.CLA);
                            Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                            Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");

                            Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                        end
                        else begin
                            Rec."Basic Salary" := 0;
                            Rec."PF Dedducation" := 0;
                            Rec."House Rent" := 0;
                            Rec."Medical Allowance" := 0;
                            Rec."Gross Salary" := 0;
                            Rec."Net Salary Payable" := 0;
                            Rec."PF Dedducation" := 0;
                            Rec.Allowances := Rec."Phone Bill" + Rec."Internet Sim";
                            Rec."Net Salary Payable" := Rec."Gross Salary" + Rec."Internet Sim" + Rec."Phone Bill" - Rec."Total Deduction";
                        end;
                    end;
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("House Rent"; Rec."House Rent")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Medical Allowance"; Rec."Medical Allowance")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("S.A.A"; Rec."S.A.A")
                {

                    ApplicationArea = all;

                }
                field(CLA; Rec.CLA)
                {
                    ApplicationArea = all;
                }
                field("Gross Salary"; Rec."Gross Salary")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
        addbefore("Personal")
        {
            group("Allowances")
            {

                field("Phone Bill"; Rec."Phone Bill")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                    begin
                        Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                        Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");
                    end;
                }
                field("Internet Sim"; Rec."Internet Sim")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                    begin
                        Rec.Allowances := (Rec."Phone Bill" + Rec."Internet Sim");
                        Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");
                    end;
                }
            }
        }
        addbefore("Payments")
        {
            group("Deductions")
            {

                field(Tax; Rec.Tax)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                    begin
                        Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                    end;
                }
                field("PF Deducation"; Rec."PF Dedducation")
                {
                    ApplicationArea = all;
                    Editable = false;
                    trigger OnValidate()
                    var
                    begin
                        Rec."Net Salary Payable" := (((Rec."Gross Salary" + Rec."Internet Sim") + Rec."Phone Bill") - Rec."Total Deduction");
                    end;
                }
                field("EOBI Paid by Employee"; Rec."EOBI Paid by Employee")
                {

                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                    begin
                        Rec."Total Deduction" := ((Rec.Tax + Rec."EOBI Paid by Employee") + Rec."PF Dedducation");
                    end;
                }
                field("EOBI Paid by Employer"; Rec."EOBI Paid by Employeer")
                {
                    ApplicationArea = all;

                }
                field("Total Deduction"; Rec."Total Deduction")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Net Salary Payable"; Rec."Net Salary Payable")
                {
                    ApplicationArea = all;
                    Editable = false;

                }
                field("Salary Payment Payable"; Rec."Salary Payment Payable")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        Isvisble: Boolean;
        employee: Record Employee;
}