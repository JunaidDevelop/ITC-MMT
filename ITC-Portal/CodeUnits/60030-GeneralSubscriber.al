// codeunit 60030 "GeneralSubscriber"
// {
//     trigger OnRun()
//     begin

//     end;
//     // Purchase line to Item ledger entries

// // 1 OnAfterCopyItemJnlLineFromPurchLine =Table "Item Journal Line"
// // 2 
//     [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
//     local procedure OnAfterCopyItemJnlLineFromSalesLine(SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line")
//     begin
//         ItemJnlLine.adc := SalesLine.adc;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, codeunit::"Item Jnl.-Post Line", 'OnAfterInsertItemLedgEntry', '', true, true)]
//     local procedure OnAfterInsertItemLedgEntry(ItemJournalLine: Record "Item Journal Line";var ItemLedgerEntry: Record "Item Ledger Entry")
//     begin
//         ItemJnlLine.adc := ItemJournalLine.adc;
//         ItemLedgerEntry.Modify();
//     end;

//     var
//         sales: Record "Item Journal Line";
// }