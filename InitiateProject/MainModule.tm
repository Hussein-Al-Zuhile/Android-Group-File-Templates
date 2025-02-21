package {package}

import org.koin.core.module.dsl.factoryOf
import org.koin.core.module.dsl.singleOf
import org.koin.core.module.dsl.viewModelOf
import org.koin.dsl.module

val MainModule = module {
    single { ExampleHttpClient }
    singleOf(::MainRepository)
    singleOf(::ExampleMQTTClient)

    //region Services
    singleOf(::MainService)
    singleOf(::AuthService)
    singleOf(::CommitteeService)
    singleOf(::TestService)
    //endregion

    //region UseCases
    //region Login UseCases
    factoryOf(::LoginUseCase)
    factoryOf(::LoginByEIDUseCase)
    //endregion

    //region Committee UseCases
    factoryOf(::GetBoardDetailsUseCase)
    factoryOf(::SubmitVehicleInspectionFormUseCase)
    factoryOf(::GetAllRoutesUseCase)
    factoryOf(::UpdateSelectedRouteUseCase)
    factoryOf(::GetSelectedRouteUseCase)
    factoryOf(::GetCommitteeUseCase)
    factoryOf(::UpdateStudentStatusUseCase)
    factoryOf(::AssignBoardAsCompletedUseCase)
    //endregion

    //region DriveTest UseCases
    factoryOf(::VerifyStudentUseCase)
    factoryOf(::GetCriteriasUseCase)
    factoryOf(::EmergencyStopUseCase)
    factoryOf(::StartTestUseCase)
    factoryOf(::EndTestUseCase)
    factoryOf(::GetAllFaultsUseCase)
    factoryOf(::AddManualSubCriteriasUseCase)
    factoryOf(::ToggleFaultStateUseCase)
    factoryOf(::SubmitTestUseCase)
    factoryOf(::GetAutoApproveResultStatusUseCase)
    factoryOf(::ToggleAutoApproveResultStatusUseCase)
    factoryOf(::TakeStudentPictureToSkipVerificationUseCase)

    factoryOf(::ConnectToVehicleMQTTUseCase)
    factoryOf(::VehicleMQTTMessageFlowUseCase)

    factoryOf(::SubscribeToLiveFaultsUseCase)
    factoryOf(::UnsubscribeFromLiveFaultsUseCase)
    factoryOf(::SubscribeToReceiveLocationUseCase)
    factoryOf(::UnsubscribeFromReceiveLocationUseCase)
    factoryOf(::SubscribeToMiddleScreenLanguageUseCase)
    factoryOf(::PublishToMiddleScreenLanguageUseCase)
    factoryOf(::PublishToStudentAssignmentOnMiddleScreenUseCase)
    factoryOf(::CancelStudentAssignmentOnMiddleScreenUseCase)
    factoryOf(::UnsubscribeFromMiddleScreenLanguageUseCase)
    //endregion

    //endregion

    //region ViewModels
    viewModelOf(::MainViewModel)

    //region Login ViewModels
    viewModelOf(::LoginViewModel)
    //endregion

    viewModelOf(::HomeViewModel)

    //region Committee ViewModels
    viewModelOf(::StudentListViewModel)
    viewModelOf(::VehicleInspectionFormViewModel)
    viewModelOf(::TestRouteSelectionViewModel)
    //endregion

    //region DriveTest ViewModels
    viewModelOf(::StudentDetailsViewModel)
    viewModelOf(::UpdateSelectedRouteViewModel)
    viewModelOf(::StudentVerificationViewModel)
    viewModelOf(::StudentVerificationSkipViewModel)
    viewModelOf(::EmergencyStopViewModel)
    viewModelOf(::RunningTestViewModel)
    viewModelOf(::AddManualSubCriteriaViewModel)
    viewModelOf(::SummaryViewModel)
    //endregion

    //endregion
}