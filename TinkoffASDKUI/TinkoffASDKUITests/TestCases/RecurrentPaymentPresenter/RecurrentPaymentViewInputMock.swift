//
//  RecurrentPaymentViewInputMock.swift
//  TinkoffASDKUI-Unit-Tests
//
//  Created by Aleksandr Pravosudov on 05.06.2023.
//

@testable import TinkoffASDKUI

final class RecurrentPaymentViewInputMock: IRecurrentPaymentViewInput {

    // MARK: - showCommonSheet

    typealias ShowCommonSheetArguments = (state: CommonSheetState, animatePullableContainerUpdates: Bool)

    var showCommonSheetCallsCount = 0
    var showCommonSheetReceivedArguments: ShowCommonSheetArguments?
    var showCommonSheetReceivedInvocations: [ShowCommonSheetArguments] = []

    func showCommonSheet(state: CommonSheetState, animatePullableContainerUpdates: Bool) {
        showCommonSheetCallsCount += 1
        let arguments = (state, animatePullableContainerUpdates)
        showCommonSheetReceivedArguments = arguments
        showCommonSheetReceivedInvocations.append(arguments)
    }

    // MARK: - hideCommonSheet

    var hideCommonSheetCallsCount = 0

    func hideCommonSheet() {
        hideCommonSheetCallsCount += 1
    }

    // MARK: - hideKeyboard

    var hideKeyboardCallsCount = 0

    func hideKeyboard() {
        hideKeyboardCallsCount += 1
    }

    // MARK: - reloadData

    var reloadDataCallsCount = 0

    func reloadData() {
        reloadDataCallsCount += 1
    }

    // MARK: - closeView

    var closeViewCallsCount = 0

    func closeView() {
        closeViewCallsCount += 1
    }
}
