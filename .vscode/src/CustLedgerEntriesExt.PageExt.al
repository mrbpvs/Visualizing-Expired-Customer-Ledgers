pageextension 50114 "Cust. Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(NumberofDaysExpired; NumberofDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of Days Expired';
                ToolTip = 'the number of days this entry is expired, based upon Due Date and today';
                StyleExpr = DaysExpiredStyle;
            }
        }
    }

    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;
                layout
                {
                    movefirst(Control1; NumberofDaysExpired)
                    moveafter(NumberofDaysExpired; "Due Date")
                }
            }
        }
    }

    var
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;
        TresholdSetup: Record "Treshold Setup";

    trigger OnOpenPage()
    begin
        if not TresholdSetup.Get() then begin
            ShowTresholdSetupNotification();
            CurrPage.Update();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        NumberofDaysExpired := Rec.GetNumberOfDaysExpired();
        case NumberofDaysExpired of
            TresholdSetup."Treshold 1 Value" .. TresholdSetup."Treshold 2 Value":
            DaysExpiredStyle := Format(TresholdSetup."Treshold 1 Style");
            TresholdSetup."Treshold 2 Value" .. 99999:
            DaysExpiredStyle:= Format(TresholdSetup."Treshold 2 Style");
            else
                DaysExpiredStyle := 'None';
        end
    end;

    local procedure ShowTresholdSetupNotification()
    var
        TresholdsetupNotification: Notification;
        TresholdSetupMsg1: Label 'You need to run the Treshold Setup: ';
        TresholdSetupActonLbl: Label 'Click here to run the TresholdSetup';

    begin
        TresholdsetupNotification.Message(TresholdSetupMsg1);
        TresholdsetupNotification.AddAction(TresholdSetupActonLbl, Codeunit::TresholdSetupMgt, 'RuntresholdSetup');
        TresholdsetupNotification.Send();
    end;
}