tableextension 50113 "Cust. Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    procedure GetNumberOfDaysExpired(): Integer
    var
        NumberOfdays: Integer;
    begin
        if Today() <= "Due Date" then
            exit(0);

        NumberOfdays := "Due Date" - Today();
        exit(Abs(NumberOfdays))
    end;
}