pageextension 60006 "SalesOrder EXT" extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("Student Source ID_ITC"; Rec."Student Source ID_ITC")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        addlast("&Print")
        {
            action("Select Student Plans")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Create;
                Enabled = Rec."Sell-to Customer No." <> '';
                trigger OnAction()
                var
                    StdPaymentPlan_lrec: Record "Student Payment Plans_ITC";
                    Stdpaymentplan_page: Page "Student Payment Plans_ITC";
                begin
                    StdPaymentPlan_lrec.Reset();
                    StdPaymentPlan_lrec.SetRange("Student ID", Rec."Sell-to Customer No.");
                    StdPaymentPlan_lrec.SetRange(Order, false);
                    StdPaymentPlan_lrec.SetRange(Invoiced, false);
                    Stdpaymentplan_page.LookupMode(true);
                    Stdpaymentplan_page.SetRecord(StdPaymentPlan_lrec);
                    Stdpaymentplan_page.SetTableView(StdPaymentPlan_lrec);
                    if Stdpaymentplan_page.RunModal() = Action::LookupOK then begin
                        Stdpaymentplan_page.SetSelectionFilter(StdPaymentPlan_lrec);
                        if StdPaymentPlan_lrec.FindSet() then
                            repeat
                                CreateSalesLine(StdPaymentPlan_lrec);
                            until StdPaymentPlan_lrec.Next() = 0;
                        Rec."Student Source ID_ITC" := StdPaymentPlan_lrec."Student ID";
                    end;
                end;
            }
        }
    }
    local procedure CreateSalesLine(StdPaymentPlan_lrec: Record "Student Payment Plans_ITC")
    var
        salesLine_lrec: Record "Sales Line";
        Nextno: Integer;
    begin

        salesLine_lrec.Reset();
        salesLine_lrec.SetRange("Document No.", Rec."No.");
        salesLine_lrec.SetRange("Document Type", Rec."Document Type");
        salesLine_lrec.SetRange(Installment_ITC, StdPaymentPlan_lrec.Installment);
        if not salesLine_lrec.FindFirst() then begin
            salesLine_lrec.Reset();
            salesLine_lrec.SetCurrentKey("Line No.");
            salesLine_lrec.SetAscending("Line No.", true);
            salesLine_lrec.SetRange("Document No.", Rec."No.");
            salesLine_lrec.SetRange("Document Type", Rec."Document Type");
            if salesLine_lrec.FindLast() then begin
                Nextno := salesLine_lrec."Line No." + 10000
            end
            else
                Nextno := 10000;
            salesLine_lrec.Init();
            salesLine_lrec."Line No." := Nextno;
            salesLine_lrec."Document No." := Rec."No.";
            salesLine_lrec."Document Type" := Rec."Document Type";
            salesLine_lrec.Type := salesLine_lrec.Type::Item;
            salesLine_lrec.Validate("No.", StdPaymentPlan_lrec.Course);
            salesLine_lrec.Validate(Quantity, 1);
            salesLine_lrec.Validate("Unit Price", StdPaymentPlan_lrec."Base Amount");
            salesLine_lrec.Validate("Line Discount %", StdPaymentPlan_lrec.Percentage);
            salesLine_lrec.Installment_ITC := StdPaymentPlan_lrec.Installment;
            salesLine_lrec.Insert();
            StdPaymentPlan_lrec.Order := true;
            StdPaymentPlan_lrec.Modify();
        end;
    end;

    var
        myInt: Integer;
}