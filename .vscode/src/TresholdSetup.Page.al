page 50115 "Treshold Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Treshold Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Treshold Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Treshold 1 Value"; Rec."Treshold 1 Value")
                {
                    ApplicationArea = All;

                }
                field("Treshold 1 Style"; Rec."Treshold 1 Style")
                {
                    ApplicationArea = all;
                }
                field("Treshold 2 Value"; Rec."Treshold 2 Value")
                {
                    ApplicationArea = all;
                }
                field("Treshold 2 Style"; Rec."Treshold 2 Style")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not rec.Get() then Rec.Insert()
    end;
}