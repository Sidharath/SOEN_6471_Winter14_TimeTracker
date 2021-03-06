/****** Object:  ForeignKey [FK_AdminPermission_UserMaster]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdminPermission_UserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdminPermission]'))
ALTER TABLE [dbo].[AdminPermission] DROP CONSTRAINT [FK_AdminPermission_UserMaster]
GO
/****** Object:  ForeignKey [FK__Module__nmProjec__3F466844]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Module__nmProjec__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[Module]'))
ALTER TABLE [dbo].[Module] DROP CONSTRAINT [FK__Module__nmProjec__3F466844]
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmUse__3E52440B]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmUse__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheet]'))
ALTER TABLE [dbo].[TimeSheet] DROP CONSTRAINT [FK__TimeSheet__nmUse__3E52440B]
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmHou__3D5E1FD2]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmHou__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail] DROP CONSTRAINT [FK__TimeSheet__nmHou__3D5E1FD2]
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmMod__3B75D760]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmMod__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail] DROP CONSTRAINT [FK__TimeSheet__nmMod__3B75D760]
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmPro__3A81B327]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmPro__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail] DROP CONSTRAINT [FK__TimeSheet__nmPro__3A81B327]
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmTim__3C69FB99]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmTim__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail] DROP CONSTRAINT [FK__TimeSheet__nmTim__3C69FB99]
GO
/****** Object:  ForeignKey [FK_UserProjectSetting_Module]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProjectSetting_Module]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]'))
ALTER TABLE [dbo].[UserProjectSetting] DROP CONSTRAINT [FK_UserProjectSetting_Module]
GO
/****** Object:  ForeignKey [FK_UserProjectSetting_Project]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProjectSetting_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]'))
ALTER TABLE [dbo].[UserProjectSetting] DROP CONSTRAINT [FK_UserProjectSetting_Project]
GO
/****** Object:  ForeignKey [FK_UserProjectSetting_UserMaster]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProjectSetting_UserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]'))
ALTER TABLE [dbo].[UserProjectSetting] DROP CONSTRAINT [FK_UserProjectSetting_UserMaster]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_ChangePassword]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_ChangePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_ChangePassword]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Login]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_Login]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Admin_Login]
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Hours_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Hours_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Hours_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Hours_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Hours_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Select_UserWise]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Select_UserWise]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_Select_UserWise]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Delete_24Hours]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Delete_24Hours]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_Delete_24Hours]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Select_Month]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Select_Month]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_Select_Month]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Month]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Month]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_Month]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AdminPermission_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_ByUserID]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_ByUserID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserProjectSetting_ByUserID]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserProjectSetting_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserProjectSetting_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserProjectSetting_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserProjectSetting_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserProjectSetting_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheetDetail_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheetDetail_Update]
GO
/****** Object:  StoredProcedure [dbo].[GetUserEfficacyReport]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserEfficacyReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserEfficacyReport]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_Today]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_Today]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_Today]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_GetTotalHoursByDate]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_GetTotalHoursByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheet_GetTotalHoursByDate]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_CheckForDuplicateModuleNameForInsert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_CheckForDuplicateModuleNameForInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_CheckForDuplicateModuleNameForInsert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_CheckForDuplicateModuleName]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_CheckForDuplicateModuleName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_CheckForDuplicateModuleName]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_AllByProjectID]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_AllByProjectID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_AllByProjectID]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_GetMoudleIDByName]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_GetMoudleIDByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_GetMoudleIDByName]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[GetProjectModulewiseReport]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetProjectModulewiseReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetProjectModulewiseReport]
GO
/****** Object:  StoredProcedure [dbo].[GetUserProjectReport]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserProjectReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserProjectReport]
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Module_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_By_TimeSheetID]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_By_TimeSheetID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheetDetail_By_TimeSheetID]
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Project_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Project_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Project_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Project_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Project_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_GetProjectIDBYName]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_GetProjectIDBYName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Project_GetProjectIDBYName]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_ChangeArchive]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_ChangeArchive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_ChangeArchive]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_ChangePassword]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_ChangePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_ChangePassword]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_GetUserIDByEamilID]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_GetUserIDByEamilID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_GetUserIDByEamilID]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_Login]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_Login]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_Login]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_Update]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_Insert]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_UserMaster_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetByProject_USERwise]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeSheetByProject_USERwise]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTimeSheetByProject_USERwise]
GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetByProjectwise]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeSheetByProjectwise]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTimeSheetByProjectwise]
GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetByUserwise]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeSheetByUserwise]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTimeSheetByUserwise]
GO
/****** Object:  StoredProcedure [dbo].[GetProjectUserwise]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetProjectUserwise]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetProjectUserwise]
GO
/****** Object:  Table [dbo].[TimeSheetDetail]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]') AND type in (N'U'))
DROP TABLE [dbo].[TimeSheetDetail]
GO
/****** Object:  Table [dbo].[AdminPermission]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminPermission]') AND type in (N'U'))
DROP TABLE [dbo].[AdminPermission]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSheet]') AND type in (N'U'))
DROP TABLE [dbo].[TimeSheet]
GO
/****** Object:  Table [dbo].[UserProjectSetting]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]') AND type in (N'U'))
DROP TABLE [dbo].[UserProjectSetting]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Module]') AND type in (N'U'))
DROP TABLE [dbo].[Module]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin]') AND type in (N'U'))
DROP TABLE [dbo].[Admin]
GO
/****** Object:  Table [dbo].[Hours]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hours]') AND type in (N'U'))
DROP TABLE [dbo].[Hours]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_DeleteRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheetDetail_DeleteRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_SelectRow]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheetDetail_SelectRow]
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TimeSheetDetail_SelectAll]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 09/09/2009 12:01:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
DROP TABLE [dbo].[Project]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 09/09/2009 12:01:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[UserMaster]
GO
/****** Object:  Role [TimeSheet]    Script Date: 09/09/2009 12:01:56 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TimeSheet')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TimeSheet' AND type = 'R')
CREATE ROLE [TimeSheet]

END
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserMaster](
	[nmUserID] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[szUserName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[szPassword] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[szPhotoPath] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[szContactPerson] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[szArchive] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__UserMaster__398D8EEE] PRIMARY KEY CLUSTERED 
(
	[nmUserID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserMaster]') AND name = N'ContactPerson')
CREATE UNIQUE NONCLUSTERED INDEX [ContactPerson] ON [dbo].[UserMaster] 
(
	[szContactPerson] ASC,
	[szUserName] ASC,
	[szPhotoPath] ASC
)WITH (IGNORE_DUP_KEY = OFF)
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(1 AS Decimal(10, 0)), N'emp1@company.com', N'a7LnwR/5IBg=', N'', N'Tarang', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(2 AS Decimal(10, 0)), N'emp2@company.com', N'cQz6Btmuba0=', N'', N'Anand', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(3 AS Decimal(10, 0)), N'emp3@company.com', N't4JEKKpQ9bE=', N'', N'Pramit', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(4 AS Decimal(10, 0)), N'emp4@company.com', N'dXeFITc61xCu4F6QFemK4Q==', N'', N'Vipul', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(5 AS Decimal(10, 0)), N'emp5@company.com', N'yO0x6PYesiM=', N'', N'Mayur', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(6 AS Decimal(10, 0)), N'emp6@company.com', N'7ed0I+jIqag=', N'', N'kuldeep', N'1')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(7 AS Decimal(10, 0)), N'emp7@company.com', N'pzRB4mLO91c=', N'', N'Dhananjay', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(8 AS Decimal(10, 0)), N'emp8@company.com', N'7C/d/q9YiEI=', N'', N'Hemant', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(9 AS Decimal(10, 0)), N'emp9@company.com', N'WEHQX7A4m+k=', N'', N'Mamta', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(10 AS Decimal(10, 0)), N'emp10@company.com', N'+vi6hKzm0+0=', N'', N'Nirav', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(11 AS Decimal(10, 0)), N'emp11@company.com', N'xyu53BxNIbg=', N'', N'Satya', N'0')
INSERT [dbo].[UserMaster] ([nmUserID], [szUserName], [szPassword], [szPhotoPath], [szContactPerson], [szArchive]) VALUES (CAST(12 AS Decimal(10, 0)), N'emp12@company.com', N'VJNYJrbJbIM=', N'', N'Komal', N'0')
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
/****** Object:  Table [dbo].[Project]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Project](
	[nmProjectID] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[szProjectName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__Project__35BCFE0A] PRIMARY KEY CLUSTERED 
(
	[nmProjectID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND name = N'ProjectName')
CREATE NONCLUSTERED INDEX [ProjectName] ON [dbo].[Project] 
(
	[szProjectName] ASC
)WITH (IGNORE_DUP_KEY = OFF)
GO
SET IDENTITY_INSERT [dbo].[Project] ON
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(37 AS Decimal(10, 0)), N'Project A')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(30 AS Decimal(10, 0)), N'Project A1')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(36 AS Decimal(10, 0)), N'Project B')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(21 AS Decimal(10, 0)), N'Project B2')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(25 AS Decimal(10, 0)), N'Project C')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(19 AS Decimal(10, 0)), N'Project C3')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(10 AS Decimal(10, 0)), N'Project D')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(26 AS Decimal(10, 0)), N'Project D4')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(6 AS Decimal(10, 0)), N'Project E')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(23 AS Decimal(10, 0)), N'Project E5')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(35 AS Decimal(10, 0)), N'Project F')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(18 AS Decimal(10, 0)), N'Project G')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(32 AS Decimal(10, 0)), N'Project H')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(22 AS Decimal(10, 0)), N'Project I')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(11 AS Decimal(10, 0)), N'Project J')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(12 AS Decimal(10, 0)), N'Project K')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(13 AS Decimal(10, 0)), N'Project L')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(4 AS Decimal(10, 0)), N'Project M')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(5 AS Decimal(10, 0)), N'Project N')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(8 AS Decimal(10, 0)), N'Project O')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(20 AS Decimal(10, 0)), N'Project P')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(7 AS Decimal(10, 0)), N'Project Q')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(27 AS Decimal(10, 0)), N'Project R')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(33 AS Decimal(10, 0)), N'Project S')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(29 AS Decimal(10, 0)), N'Project T')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(34 AS Decimal(10, 0)), N'Project U')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(31 AS Decimal(10, 0)), N'Project V')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(9 AS Decimal(10, 0)), N'Project W')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(28 AS Decimal(10, 0)), N'Project X')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(24 AS Decimal(10, 0)), N'Project Y')
INSERT [dbo].[Project] ([nmProjectID], [szProjectName]) VALUES (CAST(17 AS Decimal(10, 0)), N'Project Z')
SET IDENTITY_INSERT [dbo].[Project] OFF
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheetDetail_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:56:26 PM
-- Description:	This stored procedure is intended for selecting all rows from TimeSheetDetail table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheetDetail_SelectAll]
As
Begin
	Select 
		[nmTimeSheetDetail],
		[szDetail],
		[nmHourID],
		[nmTimeSheetID],
		[nmModule],
		[nmProjectID]
	From TimeSheetDetail
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheetDetail_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:56:26 PM
-- Description:	This stored procedure is intended for selecting a specific row from TimeSheetDetail table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheetDetail_SelectRow]
	@nmTimeSheetDetail decimal
As
Begin
	Select 
		[nmTimeSheetDetail],
		[szDetail],
		[nmHourID],
		[nmTimeSheetID],
		[nmModule],
		[nmProjectID]
	From TimeSheetDetail
	Where
		[nmTimeSheetDetail] = @nmTimeSheetDetail
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheetDetail_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:56:26 PM
-- Description:	This stored procedure is intended for deleting a specific row from TimeSheetDetail table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheetDetail_DeleteRow]
	@nmTimeSheetDetail decimal
As
Begin
	Delete TimeSheetDetail
	Where
		[nmTimeSheetDetail] = @nmTimeSheetDetail

End

' 
END
GO
/****** Object:  Table [dbo].[Hours]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hours](
	[nmHourID] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[nmHourValue] [decimal](5, 2) NULL,
 CONSTRAINT [PK__Hours__31EC6D26] PRIMARY KEY CLUSTERED 
(
	[nmHourID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Hours]') AND name = N'HourValue')
CREATE NONCLUSTERED INDEX [HourValue] ON [dbo].[Hours] 
(
	[nmHourValue] ASC
)WITH (IGNORE_DUP_KEY = OFF)
GO
SET IDENTITY_INSERT [dbo].[Hours] ON
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(1 AS Decimal(10, 0)), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(26 AS Decimal(10, 0)), CAST(0.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(2 AS Decimal(10, 0)), CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(27 AS Decimal(10, 0)), CAST(0.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(3 AS Decimal(10, 0)), CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(28 AS Decimal(10, 0)), CAST(1.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(4 AS Decimal(10, 0)), CAST(1.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(36 AS Decimal(10, 0)), CAST(1.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(5 AS Decimal(10, 0)), CAST(2.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(37 AS Decimal(10, 0)), CAST(2.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(6 AS Decimal(10, 0)), CAST(2.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(43 AS Decimal(10, 0)), CAST(2.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(7 AS Decimal(10, 0)), CAST(3.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(44 AS Decimal(10, 0)), CAST(3.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(8 AS Decimal(10, 0)), CAST(3.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(45 AS Decimal(10, 0)), CAST(3.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(9 AS Decimal(10, 0)), CAST(4.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(46 AS Decimal(10, 0)), CAST(4.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(10 AS Decimal(10, 0)), CAST(4.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(47 AS Decimal(10, 0)), CAST(4.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(11 AS Decimal(10, 0)), CAST(5.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(48 AS Decimal(10, 0)), CAST(5.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(12 AS Decimal(10, 0)), CAST(5.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(49 AS Decimal(10, 0)), CAST(5.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(13 AS Decimal(10, 0)), CAST(6.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(42 AS Decimal(10, 0)), CAST(6.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(14 AS Decimal(10, 0)), CAST(6.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(50 AS Decimal(10, 0)), CAST(6.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(15 AS Decimal(10, 0)), CAST(7.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(51 AS Decimal(10, 0)), CAST(7.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(16 AS Decimal(10, 0)), CAST(7.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(52 AS Decimal(10, 0)), CAST(7.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(17 AS Decimal(10, 0)), CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(53 AS Decimal(10, 0)), CAST(8.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(18 AS Decimal(10, 0)), CAST(8.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(54 AS Decimal(10, 0)), CAST(8.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(19 AS Decimal(10, 0)), CAST(9.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(55 AS Decimal(10, 0)), CAST(9.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(20 AS Decimal(10, 0)), CAST(9.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(56 AS Decimal(10, 0)), CAST(9.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(21 AS Decimal(10, 0)), CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(57 AS Decimal(10, 0)), CAST(10.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(22 AS Decimal(10, 0)), CAST(10.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(58 AS Decimal(10, 0)), CAST(10.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(23 AS Decimal(10, 0)), CAST(11.00 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(59 AS Decimal(10, 0)), CAST(11.25 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(24 AS Decimal(10, 0)), CAST(11.50 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(60 AS Decimal(10, 0)), CAST(11.75 AS Decimal(5, 2)))
INSERT [dbo].[Hours] ([nmHourID], [nmHourValue]) VALUES (CAST(25 AS Decimal(10, 0)), CAST(12.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Hours] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Admin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Admin](
	[szUserName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[szPassword] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__Admin__37A5467C] PRIMARY KEY CLUSTERED 
(
	[szUserName] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
INSERT [dbo].[Admin] ([szUserName], [szPassword]) VALUES (N'admin', N'5SbJDt9dmraf2Do4Z70HwA==')
/****** Object:  Table [dbo].[Module]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Module]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Module](
	[nmModule] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[szModuleName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nmProjectID] [decimal](10, 0) NULL,
 CONSTRAINT [PK__Module__33D4B598] PRIMARY KEY CLUSTERED 
(
	[nmModule] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Module]') AND name = N'ModuleName')
CREATE NONCLUSTERED INDEX [ModuleName] ON [dbo].[Module] 
(
	[szModuleName] ASC
)WITH (IGNORE_DUP_KEY = OFF)
GO
SET IDENTITY_INSERT [dbo].[Module] ON
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(15 AS Decimal(10, 0)), N'Contact Import', CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(18 AS Decimal(10, 0)), N'UI', CAST(6 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(19 AS Decimal(10, 0)), N'UI', CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(21 AS Decimal(10, 0)), N'Franchisee Area', CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(22 AS Decimal(10, 0)), N'UI', CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(25 AS Decimal(10, 0)), N'UI', CAST(13 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(27 AS Decimal(10, 0)), N'UI', CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(28 AS Decimal(10, 0)), N'UI', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(29 AS Decimal(10, 0)), N'Plesk', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(30 AS Decimal(10, 0)), N'UI', CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(31 AS Decimal(10, 0)), N'UI', CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(36 AS Decimal(10, 0)), N'test', CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(37 AS Decimal(10, 0)), N'Paypal sandbox', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(38 AS Decimal(10, 0)), N'Authenticate.net', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(39 AS Decimal(10, 0)), N'VPS', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(40 AS Decimal(10, 0)), N'Unit Testing', CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(41 AS Decimal(10, 0)), N'Drupal', CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(42 AS Decimal(10, 0)), N'UI', CAST(19 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(43 AS Decimal(10, 0)), N'UI', CAST(18 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(44 AS Decimal(10, 0)), N'Knowledge Upgrade', CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(45 AS Decimal(10, 0)), N'Admin', CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(46 AS Decimal(10, 0)), N'User', CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(47 AS Decimal(10, 0)), N'UI', CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(48 AS Decimal(10, 0)), N'Admin', CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(49 AS Decimal(10, 0)), N'Unit Testing', CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(50 AS Decimal(10, 0)), N'Hibernate Search', CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(51 AS Decimal(10, 0)), N'Unit Testing', CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(52 AS Decimal(10, 0)), N'system problem', CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(53 AS Decimal(10, 0)), N'Meeting', CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(54 AS Decimal(10, 0)), N'Registration', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(55 AS Decimal(10, 0)), N'Functionality', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(56 AS Decimal(10, 0)), N'UI', CAST(25 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(57 AS Decimal(10, 0)), N'Requirement Gathering', CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(58 AS Decimal(10, 0)), N'Db design', CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(59 AS Decimal(10, 0)), N'Bug solving', CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(60 AS Decimal(10, 0)), N'Chat', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(61 AS Decimal(10, 0)), N'Payment Gateway', CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(62 AS Decimal(10, 0)), N'File Upload', CAST(28 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(63 AS Decimal(10, 0)), N'Unit Testing', CAST(28 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(64 AS Decimal(10, 0)), N'Unit Testing', CAST(29 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(65 AS Decimal(10, 0)), N'Task', CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(66 AS Decimal(10, 0)), N'Deployment', CAST(26 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(67 AS Decimal(10, 0)), N'Initialization', CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(68 AS Decimal(10, 0)), N'Telerik Rad Ajax', CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(69 AS Decimal(10, 0)), N'New Layout', CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(70 AS Decimal(10, 0)), N'Template Implementation', CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(71 AS Decimal(10, 0)), N'UI', CAST(31 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(72 AS Decimal(10, 0)), N'OpenSRS', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(73 AS Decimal(10, 0)), N'Shopping cart', CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(74 AS Decimal(10, 0)), N'Process Table', CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(75 AS Decimal(10, 0)), N'SubDomain', CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(76 AS Decimal(10, 0)), N'Unit Testing', CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(77 AS Decimal(10, 0)), N'Requirment Gathering', CAST(32 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(78 AS Decimal(10, 0)), N'User management', CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(79 AS Decimal(10, 0)), N'UI', CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(80 AS Decimal(10, 0)), N'UI', CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(81 AS Decimal(10, 0)), N'UI', CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(82 AS Decimal(10, 0)), N'Unit Testing', CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(83 AS Decimal(10, 0)), N'Open Flash Chart', CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(84 AS Decimal(10, 0)), N'Unit Testing', CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(85 AS Decimal(10, 0)), N'UI', CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(86 AS Decimal(10, 0)), N'Common', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(87 AS Decimal(10, 0)), N'Documentation', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(88 AS Decimal(10, 0)), N'Preview_Save_Open_Report', CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(89 AS Decimal(10, 0)), N'IDocScript', CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(90 AS Decimal(10, 0)), N'Testing', CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(91 AS Decimal(10, 0)), N'Bugs solving', CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(92 AS Decimal(10, 0)), N'Testing & Bugs Solving', CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(93 AS Decimal(10, 0)), N'MenuBar_Toolbar_ContextMenu', CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(94 AS Decimal(10, 0)), N'Web crawler', CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(95 AS Decimal(10, 0)), N'Database & crawl management', CAST(35 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(96 AS Decimal(10, 0)), N'Web Service Client', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(97 AS Decimal(10, 0)), N'UI', CAST(36 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(98 AS Decimal(10, 0)), N'Update GUI', CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(99 AS Decimal(10, 0)), N'UI', CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(100 AS Decimal(10, 0)), N'UI', CAST(37 AS Decimal(10, 0)))
INSERT [dbo].[Module] ([nmModule], [szModuleName], [nmProjectID]) VALUES (CAST(101 AS Decimal(10, 0)), N'Business Link Super Admin Portal', CAST(8 AS Decimal(10, 0)))
SET IDENTITY_INSERT [dbo].[Module] OFF
/****** Object:  Table [dbo].[UserProjectSetting]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserProjectSetting](
	[nmUserProjectSettingID] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[nmProjectID] [decimal](10, 0) NULL,
	[nmModule] [decimal](10, 0) NULL,
	[nmUserID] [decimal](10, 0) NULL,
 CONSTRAINT [PK_UserProjectSetting] PRIMARY KEY CLUSTERED 
(
	[nmUserProjectSettingID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
SET IDENTITY_INSERT [dbo].[UserProjectSetting] ON
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(10 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(11 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(12 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(13 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(14 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(100 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(15 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[UserProjectSetting] ([nmUserProjectSettingID], [nmProjectID], [nmModule], [nmUserID]) VALUES (CAST(16 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
SET IDENTITY_INSERT [dbo].[UserProjectSetting] OFF
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSheet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeSheet](
	[nmTimeSheetID] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[szAdminApproval] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dtCreateDate] [datetime] NULL,
	[nmUserID] [decimal](10, 0) NULL,
 CONSTRAINT [PK__TimeSheet__300424B4] PRIMARY KEY CLUSTERED 
(
	[nmTimeSheetID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TimeSheet]') AND name = N'CreateDate')
CREATE NONCLUSTERED INDEX [CreateDate] ON [dbo].[TimeSheet] 
(
	[dtCreateDate] ASC
)WITH (IGNORE_DUP_KEY = OFF)
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] ON
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(38 AS Decimal(10, 0)), N'1', CAST(0x00009C6B011F3B3D AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(39 AS Decimal(10, 0)), N'1', CAST(0x00009C6B01217AF5 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(40 AS Decimal(10, 0)), N'1', CAST(0x00009C6B01217FA5 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(41 AS Decimal(10, 0)), N'1', CAST(0x00009C6B01234101 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(42 AS Decimal(10, 0)), N'1', CAST(0x00009C6B0125A0E1 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(43 AS Decimal(10, 0)), N'1', CAST(0x00009C6B01271F13 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(44 AS Decimal(10, 0)), N'1', CAST(0x00009C6B012923DA AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(45 AS Decimal(10, 0)), N'1', CAST(0x00009C6B012AF9E7 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(46 AS Decimal(10, 0)), N'1', CAST(0x00009C6B012B521B AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(47 AS Decimal(10, 0)), N'1', CAST(0x00009C6B012CC6DF AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(48 AS Decimal(10, 0)), N'1', CAST(0x00009C6C012206DE AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(49 AS Decimal(10, 0)), N'1', CAST(0x00009C6C0124B990 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(50 AS Decimal(10, 0)), N'1', CAST(0x00009C6C0125F574 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(51 AS Decimal(10, 0)), N'1', CAST(0x00009C6C01270830 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(52 AS Decimal(10, 0)), N'1', CAST(0x00009C6C0129BCA8 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(53 AS Decimal(10, 0)), N'1', CAST(0x00009C6C0129FDFD AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(54 AS Decimal(10, 0)), N'1', CAST(0x00009C6C00000000 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(55 AS Decimal(10, 0)), N'1', CAST(0x00009C6D00FBEB28 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(56 AS Decimal(10, 0)), N'1', CAST(0x00009C6C00000000 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(57 AS Decimal(10, 0)), N'1', CAST(0x00009C6C00000000 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(58 AS Decimal(10, 0)), N'1', CAST(0x00009C6D0108457C AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(59 AS Decimal(10, 0)), N'1', CAST(0x00009C6D010887B5 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(60 AS Decimal(10, 0)), N'1', CAST(0x00009C6D011B466D AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(61 AS Decimal(10, 0)), N'1', CAST(0x00009C6D01263390 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(62 AS Decimal(10, 0)), N'1', CAST(0x00009C6D012790A3 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(63 AS Decimal(10, 0)), N'1', CAST(0x00009C6D012BDAA1 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(64 AS Decimal(10, 0)), N'1', CAST(0x00009C6D012C6673 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(65 AS Decimal(10, 0)), N'1', CAST(0x00009C6D012D48BB AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(66 AS Decimal(10, 0)), N'1', CAST(0x00009C6F01209C77 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(67 AS Decimal(10, 0)), N'1', CAST(0x00009C6F01224AF3 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(68 AS Decimal(10, 0)), N'1', CAST(0x00009C6F01262A22 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(69 AS Decimal(10, 0)), N'1', CAST(0x00009C6F012764E9 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(70 AS Decimal(10, 0)), N'1', CAST(0x00009C6F0127F7AB AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(71 AS Decimal(10, 0)), N'1', CAST(0x00009C6F012A9A73 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(72 AS Decimal(10, 0)), N'1', CAST(0x00009C6F012E6EBE AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(73 AS Decimal(10, 0)), N'1', CAST(0x00009C6F0134F3BB AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(74 AS Decimal(10, 0)), N'1', CAST(0x00009C6F0135FC7B AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(75 AS Decimal(10, 0)), N'1', CAST(0x00009C7000B30D57 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(76 AS Decimal(10, 0)), N'1', CAST(0x00009C6D00000000 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(77 AS Decimal(10, 0)), N'1', CAST(0x00009C6F00000000 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(78 AS Decimal(10, 0)), N'1', CAST(0x00009C70011A1E0D AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(79 AS Decimal(10, 0)), N'1', CAST(0x00009C700121F541 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(80 AS Decimal(10, 0)), N'1', CAST(0x00009C70012479E5 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(81 AS Decimal(10, 0)), N'1', CAST(0x00009C7001258803 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(82 AS Decimal(10, 0)), N'1', CAST(0x00009C7001281F59 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(83 AS Decimal(10, 0)), N'1', CAST(0x00009C7001285295 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(84 AS Decimal(10, 0)), N'1', CAST(0x00009C70012AD8ED AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(85 AS Decimal(10, 0)), N'1', CAST(0x00009C70012B7BD1 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(86 AS Decimal(10, 0)), N'1', CAST(0x00009C70012BF794 AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(87 AS Decimal(10, 0)), N'1', CAST(0x00009C710119559B AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(88 AS Decimal(10, 0)), N'1', CAST(0x00009C710122F8A4 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(89 AS Decimal(10, 0)), N'1', CAST(0x00009C710126A9C2 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(90 AS Decimal(10, 0)), N'1', CAST(0x00009C7101286733 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(91 AS Decimal(10, 0)), N'1', CAST(0x00009C7101287E4F AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(92 AS Decimal(10, 0)), N'1', CAST(0x00009C710128DCD8 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(93 AS Decimal(10, 0)), N'1', CAST(0x00009C71012A1F83 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(94 AS Decimal(10, 0)), N'1', CAST(0x00009C71012BE7C6 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(95 AS Decimal(10, 0)), N'1', CAST(0x00009C71012D7BCC AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(96 AS Decimal(10, 0)), N'1', CAST(0x00009C7201227007 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(97 AS Decimal(10, 0)), N'1', CAST(0x00009C720124C4A8 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(98 AS Decimal(10, 0)), N'1', CAST(0x00009C720127B403 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(99 AS Decimal(10, 0)), N'1', CAST(0x00009C720128995F AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(100 AS Decimal(10, 0)), N'1', CAST(0x00009C720128E207 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(101 AS Decimal(10, 0)), N'1', CAST(0x00009C72012A1351 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(102 AS Decimal(10, 0)), N'1', CAST(0x00009C72012ADF80 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(103 AS Decimal(10, 0)), N'1', CAST(0x00009C72012B7072 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(104 AS Decimal(10, 0)), N'1', CAST(0x00009C72012B81F3 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(105 AS Decimal(10, 0)), N'1', CAST(0x00009C72012BBC24 AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(106 AS Decimal(10, 0)), N'1', CAST(0x00009C730112A3B9 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(107 AS Decimal(10, 0)), N'1', CAST(0x00009C73011BBBC3 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(108 AS Decimal(10, 0)), N'1', CAST(0x00009C7301252BA7 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(109 AS Decimal(10, 0)), N'1', CAST(0x00009C730125EEC1 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(110 AS Decimal(10, 0)), N'1', CAST(0x00009C730126EE9B AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(111 AS Decimal(10, 0)), N'1', CAST(0x00009C730128FDB6 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(112 AS Decimal(10, 0)), N'1', CAST(0x00009C73012944E3 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(113 AS Decimal(10, 0)), N'1', CAST(0x00009C73012BABBC AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(114 AS Decimal(10, 0)), N'1', CAST(0x00009C73012BBE65 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(115 AS Decimal(10, 0)), N'1', CAST(0x00009C73012C8C9B AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(116 AS Decimal(10, 0)), N'1', CAST(0x00009C740108DD21 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(117 AS Decimal(10, 0)), N'1', CAST(0x00009C740120C2B3 AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(118 AS Decimal(10, 0)), N'1', CAST(0x00009C7401210BC7 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(119 AS Decimal(10, 0)), N'1', CAST(0x00009C740126A37A AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(120 AS Decimal(10, 0)), N'1', CAST(0x00009C7401270B5F AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(121 AS Decimal(10, 0)), N'1', CAST(0x00009C740127D617 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(122 AS Decimal(10, 0)), N'1', CAST(0x00009C74012898D2 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(123 AS Decimal(10, 0)), N'1', CAST(0x00009C740128DCCF AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(124 AS Decimal(10, 0)), N'1', CAST(0x00009C740128F9E3 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(125 AS Decimal(10, 0)), N'1', CAST(0x00009C7500000000 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(126 AS Decimal(10, 0)), N'1', CAST(0x00009C760105C370 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(127 AS Decimal(10, 0)), N'1', CAST(0x00009C76010BE86D AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(128 AS Decimal(10, 0)), N'1', CAST(0x00009C76011BFA2A AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(129 AS Decimal(10, 0)), N'1', CAST(0x00009C76011F3008 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(130 AS Decimal(10, 0)), N'1', CAST(0x00009C7601269EFE AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(131 AS Decimal(10, 0)), N'1', CAST(0x00009C76012703F0 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(132 AS Decimal(10, 0)), N'1', CAST(0x00009C760127A7AC AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(133 AS Decimal(10, 0)), N'1', CAST(0x00009C760127FA99 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(134 AS Decimal(10, 0)), N'1', CAST(0x00009C76012884D3 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(135 AS Decimal(10, 0)), N'1', CAST(0x00009C7700D58C19 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(136 AS Decimal(10, 0)), N'1', CAST(0x00009C7400000000 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(137 AS Decimal(10, 0)), N'1', CAST(0x00009C7600000000 AS DateTime), CAST(11 AS Decimal(10, 0)))
GO
print 'Processed 100 total records'
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(138 AS Decimal(10, 0)), N'1', CAST(0x00009C7701219A37 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(139 AS Decimal(10, 0)), N'1', CAST(0x00009C770125A76A AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(140 AS Decimal(10, 0)), N'1', CAST(0x00009C77012618FA AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(141 AS Decimal(10, 0)), N'1', CAST(0x00009C7701275D42 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(142 AS Decimal(10, 0)), N'1', CAST(0x00009C770128BB72 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(143 AS Decimal(10, 0)), N'1', CAST(0x00009C77012AD996 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(144 AS Decimal(10, 0)), N'1', CAST(0x00009C77012AE4DD AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(145 AS Decimal(10, 0)), N'1', CAST(0x00009C77012C9EDD AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(146 AS Decimal(10, 0)), N'1', CAST(0x00009C7700000000 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(147 AS Decimal(10, 0)), N'1', CAST(0x00009C7800AC92DD AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(148 AS Decimal(10, 0)), N'1', CAST(0x00009C7800D72C1D AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(149 AS Decimal(10, 0)), N'1', CAST(0x00009C780117CCEB AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(150 AS Decimal(10, 0)), N'1', CAST(0x00009C780126BAD8 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(151 AS Decimal(10, 0)), N'1', CAST(0x00009C780127F00D AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(152 AS Decimal(10, 0)), N'1', CAST(0x00009C78012AA469 AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(153 AS Decimal(10, 0)), N'1', CAST(0x00009C78012AAA53 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(154 AS Decimal(10, 0)), N'1', CAST(0x00009C78012AFD91 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(155 AS Decimal(10, 0)), N'1', CAST(0x00009C78012B4B46 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(156 AS Decimal(10, 0)), N'1', CAST(0x00009C78012B5083 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(157 AS Decimal(10, 0)), N'1', CAST(0x00009C7A00D50AEB AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(158 AS Decimal(10, 0)), N'1', CAST(0x00009C7A012490F3 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(159 AS Decimal(10, 0)), N'1', CAST(0x00009C7A01273471 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(160 AS Decimal(10, 0)), N'1', CAST(0x00009C7A0127BD26 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(161 AS Decimal(10, 0)), N'1', CAST(0x00009C7A012832F6 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(162 AS Decimal(10, 0)), N'1', CAST(0x00009C7A01284106 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(163 AS Decimal(10, 0)), N'1', CAST(0x00009C7A012C139C AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(164 AS Decimal(10, 0)), N'1', CAST(0x00009C7A012CFE8E AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(165 AS Decimal(10, 0)), N'1', CAST(0x00009C7A012F1FD7 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(166 AS Decimal(10, 0)), N'1', CAST(0x00009C7A00000000 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(167 AS Decimal(10, 0)), N'1', CAST(0x00009C7B00AEE5CB AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(168 AS Decimal(10, 0)), N'1', CAST(0x00009C7B011EF8A4 AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(169 AS Decimal(10, 0)), N'1', CAST(0x00009C7B011F5F3D AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(170 AS Decimal(10, 0)), N'1', CAST(0x00009C7B01220738 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(171 AS Decimal(10, 0)), N'1', CAST(0x00009C7B0125CF63 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(172 AS Decimal(10, 0)), N'1', CAST(0x00009C7B0125F57E AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(173 AS Decimal(10, 0)), N'1', CAST(0x00009C7B0127D337 AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(174 AS Decimal(10, 0)), N'1', CAST(0x00009C7B01296487 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(175 AS Decimal(10, 0)), N'1', CAST(0x00009C7B012A0A4B AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(176 AS Decimal(10, 0)), N'1', CAST(0x00009C7B012A6490 AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(177 AS Decimal(10, 0)), N'1', CAST(0x00009C7D01114FCE AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(178 AS Decimal(10, 0)), N'1', CAST(0x00009C7D011CB987 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(179 AS Decimal(10, 0)), N'1', CAST(0x00009C7D0125D386 AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(180 AS Decimal(10, 0)), N'1', CAST(0x00009C7D01264537 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(181 AS Decimal(10, 0)), N'1', CAST(0x00009C7D01266DC6 AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(182 AS Decimal(10, 0)), N'1', CAST(0x00009C7D012881CE AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(183 AS Decimal(10, 0)), N'1', CAST(0x00009C7D01289A40 AS DateTime), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(184 AS Decimal(10, 0)), N'1', CAST(0x00009C7D012F9503 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(185 AS Decimal(10, 0)), N'1', CAST(0x00009C7E0119ADC6 AS DateTime), CAST(3 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(186 AS Decimal(10, 0)), N'1', CAST(0x00009C7E011F02B7 AS DateTime), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(187 AS Decimal(10, 0)), N'1', CAST(0x00009C7E0126B97D AS DateTime), CAST(1 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(188 AS Decimal(10, 0)), N'1', CAST(0x00009C7E0127557E AS DateTime), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(189 AS Decimal(10, 0)), N'1', CAST(0x00009C7E012857E4 AS DateTime), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(190 AS Decimal(10, 0)), N'1', CAST(0x00009C7E0129B9CC AS DateTime), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(191 AS Decimal(10, 0)), N'1', CAST(0x00009C7E012A6319 AS DateTime), CAST(2 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(192 AS Decimal(10, 0)), N'1', CAST(0x00009C7E012A82EC AS DateTime), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(193 AS Decimal(10, 0)), N'1', CAST(0x00009C7E012B56D9 AS DateTime), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheet] ([nmTimeSheetID], [szAdminApproval], [dtCreateDate], [nmUserID]) VALUES (CAST(194 AS Decimal(10, 0)), N'1', CAST(0x00009C7E00000000 AS DateTime), CAST(9 AS Decimal(10, 0)))
SET IDENTITY_INSERT [dbo].[TimeSheet] OFF
/****** Object:  Table [dbo].[AdminPermission]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdminPermission](
	[nmAdminPermission] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[dtPermissionDate] [datetime] NULL,
	[dtCreationDate] [datetime] NULL,
	[nmUserID] [decimal](10, 0) NULL,
	[szPermission] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_AdminPermission] PRIMARY KEY CLUSTERED 
(
	[nmAdminPermission] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AdminPermission]') AND name = N'PermissionDate_CreateionDate')
CREATE NONCLUSTERED INDEX [PermissionDate_CreateionDate] ON [dbo].[AdminPermission] 
(
	[dtPermissionDate] ASC,
	[dtCreationDate] ASC
)WITH (IGNORE_DUP_KEY = OFF)
GO
SET IDENTITY_INSERT [dbo].[AdminPermission] ON
INSERT [dbo].[AdminPermission] ([nmAdminPermission], [dtPermissionDate], [dtCreationDate], [nmUserID], [szPermission]) VALUES (CAST(188 AS Decimal(10, 0)), CAST(0x00009C7E00000000 AS DateTime), CAST(0x00009C7F00A985BC AS DateTime), CAST(9 AS Decimal(10, 0)), N'1')
SET IDENTITY_INSERT [dbo].[AdminPermission] OFF
/****** Object:  Table [dbo].[TimeSheetDetail]    Script Date: 09/09/2009 12:01:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TimeSheetDetail](
	[nmTimeSheetDetail] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[szDetail] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nmHourID] [decimal](10, 0) NULL,
	[nmTimeSheetID] [decimal](10, 0) NULL,
	[nmModule] [decimal](10, 0) NULL,
	[nmProjectID] [decimal](10, 0) NULL,
 CONSTRAINT [PK__TimeSheetDetail__2E1BDC42] PRIMARY KEY CLUSTERED 
(
	[nmTimeSheetDetail] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
SET IDENTITY_INSERT [dbo].[TimeSheetDetail] ON
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(154 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(155 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(156 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(157 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(158 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(42 AS Decimal(10, 0)), CAST(42 AS Decimal(10, 0)), CAST(19 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(159 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(42 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(160 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(42 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(18 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(161 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(162 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(46 AS Decimal(10, 0)), CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(163 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(45 AS Decimal(10, 0)), CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(164 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(165 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(166 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(167 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(168 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(169 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(45 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(170 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(46 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(171 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(172 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(49 AS Decimal(10, 0)), CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(173 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(174 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(175 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(176 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(49 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(177 AS Decimal(10, 0)), N'Work Detail', CAST(16 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(178 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(52 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(179 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(180 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(48 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(181 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(45 AS Decimal(10, 0)), CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(182 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(53 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(183 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(52 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(184 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(52 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(185 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(53 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(186 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(188 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(189 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(57 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(190 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(57 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(191 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(57 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(192 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(58 AS Decimal(10, 0)), CAST(46 AS Decimal(10, 0)), CAST(21 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(193 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(59 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(194 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(59 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(195 AS Decimal(10, 0)), N'Work Detail', CAST(37 AS Decimal(10, 0)), CAST(59 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(196 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(197 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(198 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(25 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(199 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(200 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(201 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(202 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(62 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(203 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(58 AS Decimal(10, 0)), CAST(57 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(204 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(58 AS Decimal(10, 0)), CAST(58 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(205 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(63 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(206 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(64 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(207 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(208 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(209 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(50 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(210 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(66 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(211 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(66 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(212 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(58 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(213 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(68 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(214 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(68 AS Decimal(10, 0)), CAST(59 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(215 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(216 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(217 AS Decimal(10, 0)), N'Work Detail', CAST(28 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(218 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(62 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(219 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(71 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(220 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(72 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(221 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(72 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(222 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(72 AS Decimal(10, 0)), CAST(63 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(223 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(72 AS Decimal(10, 0)), CAST(40 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(224 AS Decimal(10, 0)), N'Work Detail', CAST(36 AS Decimal(10, 0)), CAST(72 AS Decimal(10, 0)), CAST(64 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(225 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(73 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(226 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(74 AS Decimal(10, 0)), CAST(66 AS Decimal(10, 0)), CAST(26 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(229 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(230 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(231 AS Decimal(10, 0)), N'Work Detail', CAST(16 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(232 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(75 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(233 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(75 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(234 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(78 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(235 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(78 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(236 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(78 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(237 AS Decimal(10, 0)), N'Work Detail', CAST(16 AS Decimal(10, 0)), CAST(79 AS Decimal(10, 0)), CAST(59 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(238 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(79 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)), CAST(7 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(239 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(240 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(241 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(242 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(58 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(243 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(42 AS Decimal(10, 0)), CAST(19 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(244 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(245 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(246 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(247 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(15 AS Decimal(10, 0)), CAST(10 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(248 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(66 AS Decimal(10, 0)), CAST(26 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(249 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(250 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(251 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(252 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(85 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(253 AS Decimal(10, 0)), N'Work Detail', CAST(12 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(64 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(254 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(255 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(256 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(87 AS Decimal(10, 0)), CAST(71 AS Decimal(10, 0)), CAST(31 AS Decimal(10, 0)))
GO
print 'Processed 100 total records'
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(257 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(87 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(258 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(87 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(259 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(260 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(72 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(261 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(262 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(263 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(264 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(265 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(266 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(89 AS Decimal(10, 0)), CAST(59 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(267 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(90 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(268 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(91 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(269 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(270 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(271 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(90 AS Decimal(10, 0)), CAST(74 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(272 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(73 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(273 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(94 AS Decimal(10, 0)), CAST(75 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(274 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(94 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(275 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(94 AS Decimal(10, 0)), CAST(39 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(276 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(94 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(277 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(95 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(278 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(95 AS Decimal(10, 0)), CAST(51 AS Decimal(10, 0)), CAST(12 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(279 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(96 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(280 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(96 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(281 AS Decimal(10, 0)), N'Work Detail', CAST(12 AS Decimal(10, 0)), CAST(97 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(282 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(97 AS Decimal(10, 0)), CAST(43 AS Decimal(10, 0)), CAST(18 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(283 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(98 AS Decimal(10, 0)), CAST(74 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(284 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(99 AS Decimal(10, 0)), CAST(61 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(285 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(99 AS Decimal(10, 0)), CAST(78 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(286 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(100 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(287 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(101 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(288 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(101 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(289 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(102 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(290 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(103 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(291 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(103 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(292 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(104 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(293 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(105 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(294 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(106 AS Decimal(10, 0)), CAST(71 AS Decimal(10, 0)), CAST(31 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(295 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(106 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(25 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(296 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(106 AS Decimal(10, 0)), CAST(79 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(297 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(106 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(298 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(107 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(299 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(107 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(300 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(108 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(301 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(108 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(302 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(109 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(303 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(110 AS Decimal(10, 0)), CAST(74 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(304 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(111 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(305 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(111 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(306 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(112 AS Decimal(10, 0)), CAST(78 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(307 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(112 AS Decimal(10, 0)), CAST(73 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(308 AS Decimal(10, 0)), N'Work Detail', CAST(36 AS Decimal(10, 0)), CAST(113 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(309 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(114 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(310 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(113 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(311 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(114 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(312 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(113 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(313 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(115 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(314 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(115 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(315 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(115 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(316 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(116 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(317 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(116 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(318 AS Decimal(10, 0)), N'Work Detail', CAST(28 AS Decimal(10, 0)), CAST(116 AS Decimal(10, 0)), CAST(85 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(319 AS Decimal(10, 0)), N'Work Detail', CAST(12 AS Decimal(10, 0)), CAST(116 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(320 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(117 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(321 AS Decimal(10, 0)), N'Work Detail', CAST(36 AS Decimal(10, 0)), CAST(118 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(322 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(118 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(323 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(118 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(324 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(118 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(325 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(118 AS Decimal(10, 0)), CAST(87 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(326 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(117 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(327 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(119 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(328 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(120 AS Decimal(10, 0)), CAST(88 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(329 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(121 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(330 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(121 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(331 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(122 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(332 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(122 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(333 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(123 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(334 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(123 AS Decimal(10, 0)), CAST(54 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(335 AS Decimal(10, 0)), N'Work Detail', CAST(37 AS Decimal(10, 0)), CAST(123 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(336 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(123 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(337 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(124 AS Decimal(10, 0)), CAST(78 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(338 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(124 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(339 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(124 AS Decimal(10, 0)), CAST(89 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(340 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(124 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(341 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(108 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(342 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(121 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(343 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(125 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(344 AS Decimal(10, 0)), N'Work Detail', CAST(36 AS Decimal(10, 0)), CAST(126 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(345 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(127 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(346 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(128 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(347 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(128 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(348 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(128 AS Decimal(10, 0)), CAST(79 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(349 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(128 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(350 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(128 AS Decimal(10, 0)), CAST(85 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(351 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(129 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(352 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(129 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(353 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(127 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(354 AS Decimal(10, 0)), N'Work Detail', CAST(42 AS Decimal(10, 0)), CAST(126 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(355 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(130 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(356 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(131 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(357 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(131 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
GO
print 'Processed 200 total records'
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(358 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(132 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(359 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(133 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(360 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(134 AS Decimal(10, 0)), CAST(73 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(361 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(134 AS Decimal(10, 0)), CAST(70 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(362 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(134 AS Decimal(10, 0)), CAST(94 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(363 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(135 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(364 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(136 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(365 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(136 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(366 AS Decimal(10, 0)), N'Work Detail', CAST(53 AS Decimal(10, 0)), CAST(137 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(367 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(135 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(25 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(368 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(135 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(369 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(135 AS Decimal(10, 0)), CAST(27 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(370 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(138 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(371 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(138 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(372 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(138 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(373 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(138 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(374 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(139 AS Decimal(10, 0)), CAST(77 AS Decimal(10, 0)), CAST(32 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(375 AS Decimal(10, 0)), N'Work Detail', CAST(12 AS Decimal(10, 0)), CAST(139 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(376 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(140 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(377 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(140 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(378 AS Decimal(10, 0)), N'Work Detail', CAST(50 AS Decimal(10, 0)), CAST(141 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(379 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(141 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(380 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(141 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(381 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(142 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(382 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(142 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(383 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(142 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(384 AS Decimal(10, 0)), N'Work Detail', CAST(42 AS Decimal(10, 0)), CAST(143 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(385 AS Decimal(10, 0)), N'Work Detail', CAST(28 AS Decimal(10, 0)), CAST(143 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(386 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(144 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(387 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(145 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(388 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(145 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(389 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(145 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(390 AS Decimal(10, 0)), N'Work Detail', CAST(51 AS Decimal(10, 0)), CAST(146 AS Decimal(10, 0)), CAST(95 AS Decimal(10, 0)), CAST(35 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(391 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(392 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(148 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(393 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(25 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(394 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(395 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(396 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(149 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(397 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(398 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(149 AS Decimal(10, 0)), CAST(96 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(399 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(97 AS Decimal(10, 0)), CAST(36 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(400 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(147 AS Decimal(10, 0)), CAST(79 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(401 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(150 AS Decimal(10, 0)), CAST(95 AS Decimal(10, 0)), CAST(35 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(402 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(150 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(403 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(151 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(404 AS Decimal(10, 0)), N'Work Detail', CAST(37 AS Decimal(10, 0)), CAST(152 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(405 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(152 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(406 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(153 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(407 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(153 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(408 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(154 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(409 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(154 AS Decimal(10, 0)), CAST(53 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(410 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(155 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(411 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(156 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(412 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(156 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(413 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(157 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(414 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(157 AS Decimal(10, 0)), CAST(97 AS Decimal(10, 0)), CAST(36 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(415 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(157 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(416 AS Decimal(10, 0)), N'Work Detail', CAST(28 AS Decimal(10, 0)), CAST(157 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(417 AS Decimal(10, 0)), N'Work Detail', CAST(28 AS Decimal(10, 0)), CAST(157 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(418 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(158 AS Decimal(10, 0)), CAST(96 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(419 AS Decimal(10, 0)), N'Work Detail', CAST(49 AS Decimal(10, 0)), CAST(158 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(420 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(159 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(421 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(160 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(422 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(160 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(423 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(161 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(424 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(162 AS Decimal(10, 0)), CAST(95 AS Decimal(10, 0)), CAST(35 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(425 AS Decimal(10, 0)), N'Work Detail', CAST(16 AS Decimal(10, 0)), CAST(162 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(426 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(163 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(427 AS Decimal(10, 0)), N'Work Detail', CAST(48 AS Decimal(10, 0)), CAST(163 AS Decimal(10, 0)), CAST(19 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(428 AS Decimal(10, 0)), N'Work Detail', CAST(42 AS Decimal(10, 0)), CAST(164 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(429 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(164 AS Decimal(10, 0)), CAST(82 AS Decimal(10, 0)), CAST(33 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(430 AS Decimal(10, 0)), N'Work Detail', CAST(53 AS Decimal(10, 0)), CAST(165 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(431 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(166 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(432 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(166 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(433 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(167 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(434 AS Decimal(10, 0)), N'Work Detail', CAST(28 AS Decimal(10, 0)), CAST(167 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(435 AS Decimal(10, 0)), N'Work Detail', CAST(46 AS Decimal(10, 0)), CAST(167 AS Decimal(10, 0)), CAST(47 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(436 AS Decimal(10, 0)), N'Work Detail', CAST(14 AS Decimal(10, 0)), CAST(168 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(437 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(168 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(438 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(168 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(439 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(169 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(440 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(170 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(441 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(170 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(442 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(170 AS Decimal(10, 0)), CAST(67 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(443 AS Decimal(10, 0)), N'Work Detail', CAST(44 AS Decimal(10, 0)), CAST(171 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(444 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(171 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(445 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(172 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(446 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(172 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(447 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(172 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(448 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(173 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(449 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(174 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(450 AS Decimal(10, 0)), N'Work Detail', CAST(3 AS Decimal(10, 0)), CAST(175 AS Decimal(10, 0)), CAST(83 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(451 AS Decimal(10, 0)), N'Work Detail', CAST(15 AS Decimal(10, 0)), CAST(175 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(452 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(176 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(453 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(177 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(454 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(177 AS Decimal(10, 0)), CAST(44 AS Decimal(10, 0)), CAST(24 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(455 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(177 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(457 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(178 AS Decimal(10, 0)), CAST(29 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(458 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(178 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(459 AS Decimal(10, 0)), N'Work Detail', CAST(7 AS Decimal(10, 0)), CAST(179 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
GO
print 'Processed 300 total records'
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(460 AS Decimal(10, 0)), N'Work Detail', CAST(10 AS Decimal(10, 0)), CAST(179 AS Decimal(10, 0)), CAST(60 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(461 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(180 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(462 AS Decimal(10, 0)), N'Work Detail', CAST(16 AS Decimal(10, 0)), CAST(180 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(463 AS Decimal(10, 0)), N'Work Detail', CAST(53 AS Decimal(10, 0)), CAST(181 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(464 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(179 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(465 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(182 AS Decimal(10, 0)), CAST(93 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(466 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(183 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(467 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(182 AS Decimal(10, 0)), CAST(98 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(468 AS Decimal(10, 0)), N'Work Detail', CAST(53 AS Decimal(10, 0)), CAST(184 AS Decimal(10, 0)), CAST(19 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(469 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(185 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(470 AS Decimal(10, 0)), N'Work Detail', CAST(26 AS Decimal(10, 0)), CAST(185 AS Decimal(10, 0)), CAST(99 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(471 AS Decimal(10, 0)), N'Work Detail', CAST(27 AS Decimal(10, 0)), CAST(185 AS Decimal(10, 0)), CAST(80 AS Decimal(10, 0)), CAST(34 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(472 AS Decimal(10, 0)), N'Work Detail', CAST(4 AS Decimal(10, 0)), CAST(185 AS Decimal(10, 0)), CAST(28 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(473 AS Decimal(10, 0)), N'Work Detail', CAST(11 AS Decimal(10, 0)), CAST(185 AS Decimal(10, 0)), CAST(100 AS Decimal(10, 0)), CAST(37 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(474 AS Decimal(10, 0)), N'Work Detail', CAST(2 AS Decimal(10, 0)), CAST(186 AS Decimal(10, 0)), CAST(38 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(475 AS Decimal(10, 0)), N'Work Detail', CAST(8 AS Decimal(10, 0)), CAST(186 AS Decimal(10, 0)), CAST(86 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(476 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(186 AS Decimal(10, 0)), CAST(101 AS Decimal(10, 0)), CAST(8 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(477 AS Decimal(10, 0)), N'Work Detail', CAST(5 AS Decimal(10, 0)), CAST(187 AS Decimal(10, 0)), CAST(56 AS Decimal(10, 0)), CAST(23 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(478 AS Decimal(10, 0)), N'Work Detail', CAST(13 AS Decimal(10, 0)), CAST(187 AS Decimal(10, 0)), CAST(81 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(479 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(188 AS Decimal(10, 0)), CAST(98 AS Decimal(10, 0)), CAST(30 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(480 AS Decimal(10, 0)), N'Work Detail', CAST(17 AS Decimal(10, 0)), CAST(189 AS Decimal(10, 0)), CAST(65 AS Decimal(10, 0)), CAST(9 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(481 AS Decimal(10, 0)), N'Work Detail', CAST(12 AS Decimal(10, 0)), CAST(190 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(482 AS Decimal(10, 0)), N'Work Detail', CAST(43 AS Decimal(10, 0)), CAST(190 AS Decimal(10, 0)), CAST(55 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(483 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(191 AS Decimal(10, 0)), CAST(19 AS Decimal(10, 0)), CAST(11 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(484 AS Decimal(10, 0)), N'Work Detail', CAST(6 AS Decimal(10, 0)), CAST(192 AS Decimal(10, 0)), CAST(76 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(485 AS Decimal(10, 0)), N'Work Detail', CAST(49 AS Decimal(10, 0)), CAST(192 AS Decimal(10, 0)), CAST(84 AS Decimal(10, 0)), CAST(20 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(486 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(193 AS Decimal(10, 0)), CAST(92 AS Decimal(10, 0)), CAST(4 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(487 AS Decimal(10, 0)), N'Work Detail', CAST(46 AS Decimal(10, 0)), CAST(193 AS Decimal(10, 0)), CAST(69 AS Decimal(10, 0)), CAST(5 AS Decimal(10, 0)))
INSERT [dbo].[TimeSheetDetail] ([nmTimeSheetDetail], [szDetail], [nmHourID], [nmTimeSheetID], [nmModule], [nmProjectID]) VALUES (CAST(488 AS Decimal(10, 0)), N'Work Detail', CAST(9 AS Decimal(10, 0)), CAST(194 AS Decimal(10, 0)), CAST(41 AS Decimal(10, 0)), CAST(17 AS Decimal(10, 0)))
SET IDENTITY_INSERT [dbo].[TimeSheetDetail] OFF
/****** Object:  StoredProcedure [dbo].[GetProjectUserwise]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetProjectUserwise]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProjectUserwise]
 @StartDate Datetime,
 @EndDate Datetime,
 @ProjectID int

AS
BEGIN


SELECT 
 SUM(HO.nmHourValue) as Hours,
 UM.szContactPerson
FROM 
TimeSheet TS
INNER JOIN TimeSheetDetail TSD
ON TS.nmTimeSheetID = TSD.nmTimeSheetID
AND TSD.nmProjectID = @ProjectID
AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
INNER JOIN Hours HO
ON HO.nmHourID = TSD.nmHourID
INNER JOIN dbo.UserMaster UM
ON UM.nmUserID = TS.nmUserID
AND UM.szArchive = ''0''
GROUP BY  UM.szContactPerson


   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetByUserwise]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeSheetByUserwise]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetTimeSheetByUserwise]
 @StartDate Datetime,
 @EndDate Datetime,
 @UserID int

AS
BEGIN

	Select 
    CONVERT(VARCHAR(10), TS.dtCreateDate, 101) as Date,
	 PR.szProjectName as Project, 
	 MO.szModuleName as Module,
	 HO.nmHourValue as Hours,
	 UM.szContactPerson as UserName,
	 TSD.szDetail as Detail
	FROM
	  dbo.TimeSheet TS
	INNER JOIN dbo.TimeSheetDetail TSD
	 ON TS.nmTimeSheetID = TSD.nmTimeSheetID
     AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
	INNER JOIN dbo.Project PR
	 ON PR.nmProjectID = TSD.nmProjectID 
	INNER JOIN Module MO
	 ON MO.nmModule = TSD.nmModule
	INNER JOIN dbo.Hours HO
	 ON HO.nmHourID = TSD.nmHourID 
	INNER JOIN dbo.UserMaster UM
	 ON UM.nmUserID = TS.nmUserID
	AND UM.szArchive = ''0''
    WHERE UM.nmUserID = @UserID
	ORDER BY  PR.szProjectName, TS.dtCreateDate
   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetByProjectwise]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeSheetByProjectwise]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetTimeSheetByProjectwise]
 @StartDate Datetime,
 @EndDate Datetime,
 @ProjectID int

AS
BEGIN

	Select 
     CONVERT(VARCHAR(10), TS.dtCreateDate, 101) as Date,
	 PR.szProjectName as Project, 
	 MO.szModuleName as Module,
	 HO.nmHourValue as Hours,
	 UM.szContactPerson as UserName,
	 TSD.szDetail as Detail
	FROM
	  dbo.TimeSheet TS
	INNER JOIN dbo.TimeSheetDetail TSD
	 ON TS.nmTimeSheetID = TSD.nmTimeSheetID
     AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
     AND TSD.nmProjectID = @ProjectID
	INNER JOIN dbo.Project PR
	 ON PR.nmProjectID = TSD.nmProjectID 
	INNER JOIN Module MO
	 ON MO.nmModule = TSD.nmModule
	INNER JOIN dbo.Hours HO
	 ON HO.nmHourID = TSD.nmHourID 
	INNER JOIN dbo.UserMaster UM
	 ON UM.nmUserID = TS.nmUserID
   AND UM.szArchive = ''0''
	ORDER BY  PR.szProjectName, TS.dtCreateDate
   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetTimeSheetByProject_USERwise]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTimeSheetByProject_USERwise]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetTimeSheetByProject_USERwise]
 @StartDate Datetime,
 @EndDate Datetime,
 @ProjectID int,
 @UserID int

AS
BEGIN

	Select 
	CONVERT(VARCHAR(10), TS.dtCreateDate, 101) as Date,
	 PR.szProjectName as Project, 
	 MO.szModuleName as Module,
	 HO.nmHourValue as Hours,
	 UM.szContactPerson as UserName,
	 TSD.szDetail as Detail
	FROM
	  dbo.TimeSheet TS
	INNER JOIN dbo.TimeSheetDetail TSD
	 ON TS.nmTimeSheetID = TSD.nmTimeSheetID
     AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
     AND TSD.nmProjectID = @ProjectID
	INNER JOIN dbo.Project PR
	 ON PR.nmProjectID = TSD.nmProjectID 
	INNER JOIN Module MO
	 ON MO.nmModule = TSD.nmModule
	INNER JOIN dbo.Hours HO
	 ON HO.nmHourID = TSD.nmHourID 
	INNER JOIN dbo.UserMaster UM
	 ON UM.nmUserID = TS.nmUserID
	AND UM.szArchive = ''0''
    WHERE UM.nmUserID=  @UserID
	ORDER BY  PR.szProjectName, TS.dtCreateDate
   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserMaster_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/8/2009 11:49:11 AM
-- Description:	This stored procedure is intended for selecting all rows from UserMaster table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_UserMaster_SelectAll]
@Search VARCHAR(50),
@szArchive VARCHAR(1)
As
Begin
	Select 
		[nmUserID],
		[szUserName],
		[szPassword],
		szPhotoPath,
		szContactPerson,
		szArchive
	From UserMaster
      WHERE szArchive = @szArchive AND (szUserName Like @Search + ''%'' OR szContactPerson Like @Search + ''%'')
			
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserMaster_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/8/2009 11:49:11 AM
-- Description:	This stored procedure is intended for selecting a specific row from UserMaster table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_UserMaster_SelectRow]
	@nmUserID decimal
As
Begin
	Select 
		[nmUserID],
		[szUserName],
		[szPassword],
		szPhotoPath,
		szContactPerson,
		szArchive
	From UserMaster
	Where
		[nmUserID] = @nmUserID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserMaster_Insert
-- Author:	Tarang Patel
-- Create date:	8/8/2009 11:49:11 AM
-- Description:	This stored procedure is intended for inserting values to UserMaster table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_UserMaster_Insert]
	@szUserName varchar(100),
	@szPassword varchar(50),
	@szPhotoPath varchar(50),
	@szContactPerson varchar(50),
	@szArchive varchar(1)
As
Begin
	Insert Into UserMaster
		([szUserName],[szPassword],[szPhotoPath],[szContactPerson],szArchive)
	Values
		(@szUserName,@szPassword,@szPhotoPath,@szContactPerson,@szArchive)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserMaster_Update
-- Author:	Tarang Patel
-- Create date:	8/8/2009 11:49:11 AM
-- Description:	This stored procedure is intended for updating UserMaster table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_UserMaster_Update]
	@nmUserID decimal,
	@szUserName varchar(100),
	@szPassword varchar(50),
	@szPhotoPath varchar(50),
	@szContactPerson varchar(50)
As
Begin
	Update UserMaster
	Set
		[szUserName] = @szUserName,
		[szPassword] = @szPassword,
        szPhotoPath= @szPhotoPath,
	    szContactPerson = @szContactPerson 
	Where		
		[nmUserID] = @nmUserID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserMaster_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/8/2009 11:49:11 AM
-- Description:	This stored procedure is intended for deleting a specific row from UserMaster table
-- ==========================================================================================
Create Procedure [dbo].[sp_UserMaster_DeleteRow]
	@nmUserID decimal
As
Begin
	Delete UserMaster
	Where
		[nmUserID] = @nmUserID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_Login]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_Login]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_UserMaster_Login]
@szUserName VARCHAR(50),
@szPassword VARCHAR(50)

As
Begin
	Select 
		[nmUserID],
		szUserName, 
		szPassword,
		szPhotoPath,
		szContactPerson,
		szArchive

	From UserMaster
     WHERE
		[szUserName] = @szUserName AND
		[szPassword] = @szPassword AND 
	   szArchive = 0
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_GetUserIDByEamilID]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_GetUserIDByEamilID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_UserMaster_GetUserIDByEamilID]
	@szUserName varchar(100)
As
Begin
	Select 		
		[nmUserID],
		szUserName,
		szPassword,
		szPhotoPath,
		szContactPerson,
		szArchive
	From UserMaster
	Where
		[szUserName] = @szUserName AND 
		szArchive = ''0''
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_ChangePassword]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_ChangePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Procedure [dbo].[sp_UserMaster_ChangePassword]
	@nmUserID decimal,
	@szPassword varchar(50)
	
As
Begin
	Update UserMaster
	Set		
		[szPassword] = @szPassword       
	Where		
		[nmUserID] = @nmUserID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMaster_ChangeArchive]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserMaster_ChangeArchive]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Procedure [dbo].[sp_UserMaster_ChangeArchive]
	@nmUserID decimal,
	@szArchive varchar(1)
	
As
Begin
	Update UserMaster
	Set		
		[szArchive] = @szArchive       
	Where		
		[nmUserID] = @nmUserID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_GetProjectIDBYName]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_GetProjectIDBYName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_Project_GetProjectIDBYName]
	@szProjectName VARCHAR(50)
As
Begin
	Select 
		[nmProjectID],
		[szProjectName]
	From Project
	Where
		[szProjectName] = @szProjectName
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Project_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:45:53 PM
-- Description:	This stored procedure is intended for selecting all rows from Project table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_Project_SelectAll]
@szSearch VARCHAR(50)
As
Begin
	Select 
		[nmProjectID],
		[szProjectName]
	From Project
      WHERE szProjectName Like ''%'' + @szSearch + ''%''
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Project_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:45:53 PM
-- Description:	This stored procedure is intended for selecting a specific row from Project table
-- ==========================================================================================
Create Procedure [dbo].[sp_Project_SelectRow]
	@nmProjectID decimal
As
Begin
	Select 
		[nmProjectID],
		[szProjectName]
	From Project
	Where
		[nmProjectID] = @nmProjectID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Project_Insert
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:45:53 PM
-- Description:	This stored procedure is intended for inserting values to Project table
-- ==========================================================================================
Create Procedure [dbo].[sp_Project_Insert]
	@szProjectName varchar(50)
As
Begin
	Insert Into Project
		([szProjectName])
	Values
		(@szProjectName)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Project_Update
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:45:53 PM
-- Description:	This stored procedure is intended for updating Project table
-- ==========================================================================================
Create Procedure [dbo].[sp_Project_Update]
	@nmProjectID decimal,
	@szProjectName varchar(50)
As
Begin
	Update Project
	Set
		[szProjectName] = @szProjectName
	Where		
		[nmProjectID] = @nmProjectID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Project_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Project_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Project_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:45:53 PM
-- Description:	This stored procedure is intended for deleting a specific row from Project table
-- ==========================================================================================
Create Procedure [dbo].[sp_Project_DeleteRow]
	@nmProjectID decimal
As
Begin
	Delete Project
	Where
		[nmProjectID] = @nmProjectID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_By_TimeSheetID]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_By_TimeSheetID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_TimeSheetDetail_By_TimeSheetID]
 @nmTimeSheetID int
As
Begin
Select
  TSD.nmTimeSheetDetail,
  TSD.nmProjectID,
  TSD.nmModule,
  TSD.nmHourID,  
  TSD.szDetail,  
  TSD.nmTimeSheetID,
  PR.szProjectName,
  MO.szModuleName,
  HO.nmHourValue


 From TimeSheetDetail TSD
 INNER JOIN Project PR
 ON PR.nmProjectID = TSD.nmProjectID
 INNER JOIN Module MO
 ON MO.nmModule = TSD.nmModule
 INNER JOIN Hours HO
 ON HO.nmHourID = TSD.nmHourID
 WHERE   TSD.nmTimeSheetID = @nmTimeSheetID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Module_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:40:03 PM
-- Description:	This stored procedure is intended for selecting all rows from Module table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_Module_SelectAll]
@szSearch VARCHAR(50)
As
Begin
	Select 
		M.[nmModule],
		M.[szModuleName],
		M.[nmProjectID],
		P.szProjectName
	From Module M
    INNER JOIN Project P
	ON M.[nmProjectID] = P.[nmProjectID]
    WHERE 
		P.szProjectName Like ''%'' + @szSearch + ''%'' OR
		M.[szModuleName] Like ''%'' + @szSearch + ''%''
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserProjectReport]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserProjectReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetUserProjectReport]
 @StartDate Datetime,
 @EndDate Datetime,
 @UserID int

AS
BEGIN

SELECT 
 SUM(HO.nmHourValue) AS Hours,
 PR.szProjectName 
FROM 
TimeSheet TS
INNER JOIN TimeSheetDetail TSD
ON TS.nmTimeSheetID = TSD.nmTimeSheetID
AND TS.nmUserID = @UserID
AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
INNER JOIN Hours HO
ON HO.nmHourID = TSD.nmHourID
INNER JOIN Project PR
ON PR.nmProjectID = TSD.nmProjectID
GROUP BY  PR.szProjectName
   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProjectModulewiseReport]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetProjectModulewiseReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProjectModulewiseReport]
 @StartDate Datetime,
 @EndDate Datetime,
 @ProjectID int

AS
BEGIN


SELECT 
 SUM(HO.nmHourValue) as Hours,
 MO.szModuleName
FROM 
TimeSheet TS
INNER JOIN TimeSheetDetail TSD
ON TS.nmTimeSheetID = TSD.nmTimeSheetID
AND TSD.nmProjectID = @ProjectID
AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
INNER JOIN Hours HO
ON HO.nmHourID = TSD.nmHourID
INNER JOIN Module MO
ON MO.nmModule = TSD.nmModule
GROUP BY  MO.szModuleName


   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Module_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:40:03 PM
-- Description:	This stored procedure is intended for selecting a specific row from Module table
-- ==========================================================================================
Create Procedure [dbo].[sp_Module_SelectRow]
	@nmModule decimal
As
Begin
	Select 
		[nmModule],
		[szModuleName],
		[nmProjectID]
	From Module
	Where
		[nmModule] = @nmModule
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Module_Insert
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:40:03 PM
-- Description:	This stored procedure is intended for inserting values to Module table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_Module_Insert]
	@szModuleName varchar(50),
	@nmProjectID decimal
As
Begin
	Insert Into Module
		([szModuleName],[nmProjectID])
	Values
		(@szModuleName,@nmProjectID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Module_Update
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:40:03 PM
-- Description:	This stored procedure is intended for updating Module table
-- ==========================================================================================
Create Procedure [dbo].[sp_Module_Update]
	@nmModule decimal,
	@szModuleName varchar(50),
	@nmProjectID decimal
As
Begin
	Update Module
	Set
		[szModuleName] = @szModuleName,
		[nmProjectID] = @nmProjectID
	Where		
		[nmModule] = @nmModule

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Module_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:40:03 PM
-- Description:	This stored procedure is intended for deleting a specific row from Module table
-- ==========================================================================================
Create Procedure [dbo].[sp_Module_DeleteRow]
	@nmModule decimal
As
Begin
	Delete Module
	Where
		[nmModule] = @nmModule

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_GetMoudleIDByName]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_GetMoudleIDByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_Module_GetMoudleIDByName]
	@szModuleName VARCHAR(50),
	@nmProjectID int
As
Begin
	Select 
		M.[nmModule],
		M.[szModuleName],
		M.[nmProjectID]
	From Module M    
    WHERE 		
		M.[szModuleName] = @szModuleName and
		M.[nmProjectID] = @nmProjectID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_AllByProjectID]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_AllByProjectID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_Module_AllByProjectID]
	@nmProjectID decimal
As
Begin
	Select 
		[nmModule],
		[szModuleName],
		[nmProjectID]
	From Module
	Where
		[nmProjectID] = @nmProjectID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_CheckForDuplicateModuleName]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_CheckForDuplicateModuleName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_Module_CheckForDuplicateModuleName]
	@szModuleName VARCHAR(50),
	@nmProjectID int,
    @nmModule int
As
Begin
	Select 
		M.[nmModule],
		M.[szModuleName],
		M.[nmProjectID]
	From Module M    
    WHERE 		
		M.[szModuleName] = @szModuleName and
		M.[nmProjectID] = @nmProjectID and
        M.[nmModule] <> @nmModule
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Module_CheckForDuplicateModuleNameForInsert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Module_CheckForDuplicateModuleNameForInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_Module_CheckForDuplicateModuleNameForInsert]
	@szModuleName VARCHAR(50),
	@nmProjectID int
As
Begin
	Select 
		M.[nmModule],
		M.[szModuleName],
		M.[nmProjectID]
	From Module M    
    WHERE 		
		M.[szModuleName] = @szModuleName and
		M.[nmProjectID] = @nmProjectID 
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_GetTotalHoursByDate]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_GetTotalHoursByDate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Procedure [dbo].[sp_TimeSheet_GetTotalHoursByDate]
	@nmUserID decimal,
    @StartDate DateTime,
    @ENDDate DateTime
As
Begin
	SELECT 
	ISNULL(SUM(HO.nmHourValue),0) AS TotalHours
	From 
	TimeSheet TS
	INNER JOIN TimeSheetDetail TSD
	ON TS.nmTimeSheetID = TSD.nmTimeSheetID
	AND TS.nmUserID = @nmUserID
	AND dtCreateDate Between @StartDate AND @ENDDate
	INNER JOIN dbo.Hours HO
	ON HO.nmHourID = TSD.nmHourID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheet_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:49:35 PM
-- Description:	This stored procedure is intended for selecting all rows from TimeSheet table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheet_SelectAll]
As
Begin
	Select 
		[nmTimeSheetID],
		[szAdminApproval],
		[dtCreateDate],
		[nmUserID]
	From TimeSheet
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheet_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:49:35 PM
-- Description:	This stored procedure is intended for selecting a specific row from TimeSheet table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheet_SelectRow]
	@nmTimeSheetID decimal
As
Begin
	Select 
		[nmTimeSheetID],
		[szAdminApproval],
		[dtCreateDate],
		[nmUserID]
	From TimeSheet
	Where
		[nmTimeSheetID] = @nmTimeSheetID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheet_Insert
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:49:35 PM
-- Description:	This stored procedure is intended for inserting values to TimeSheet table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_TimeSheet_Insert]
	@szAdminApproval varchar(20),
	@dtCreateDate datetime,
	@nmUserID decimal,
  @nmTimeSheetID INT OUTPUT
As
Begin
	Insert Into TimeSheet
		([szAdminApproval],[dtCreateDate],[nmUserID])
	Values
		(@szAdminApproval,@dtCreateDate,@nmUserID)


SET @nmTimeSheetID = @@Identity
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheet_Update
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:49:35 PM
-- Description:	This stored procedure is intended for updating TimeSheet table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheet_Update]
	@nmTimeSheetID decimal,
	@szAdminApproval varchar(20),
	@dtCreateDate datetime,
	@nmUserID decimal
As
Begin
	Update TimeSheet
	Set
		[szAdminApproval] = @szAdminApproval,
		[dtCreateDate] = @dtCreateDate,
		[nmUserID] = @nmUserID
	Where		
		[nmTimeSheetID] = @nmTimeSheetID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheet_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:49:35 PM
-- Description:	This stored procedure is intended for deleting a specific row from TimeSheet table
-- ==========================================================================================
Create Procedure [dbo].[sp_TimeSheet_DeleteRow]
	@nmTimeSheetID decimal
As
Begin
	Delete TimeSheet
	Where
		[nmTimeSheetID] = @nmTimeSheetID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheet_Today]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheet_Today]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_TimeSheet_Today]
  @nmUserID int,
  @dtCreateDate Datetime
As
Begin
	Select 
		[nmTimeSheetID],
		[szAdminApproval],
		[dtCreateDate],
		[nmUserID]
	From TimeSheet
     WHERE nmUserID =@nmUserID AND 
	 CONVERT(varchar(10),dtCreateDate,101) = CONVERT(varchar(10),@dtCreateDate,101) 
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserEfficacyReport]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserEfficacyReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetUserEfficacyReport]
 @StartDate Datetime,
 @EndDate Datetime,
 @UserID int

AS
BEGIN

SELECT 
 SUM(HO.nmHourValue) AS Hours,
CONVERT(VARCHAR(10), TS.dtCreateDate, 101) AS DATE 
FROM 
TimeSheet TS
INNER JOIN TimeSheetDetail TSD
ON TS.nmTimeSheetID = TSD.nmTimeSheetID
AND TS.nmUserID = @UserID
AND TS.dtCreateDate BETWEEN @StartDate AND @EndDate
INNER JOIN Hours HO
ON HO.nmHourID = TSD.nmHourID
GROUP BY  TS.dtCreateDate
   
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheetDetail_Update
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:56:26 PM
-- Description:	This stored procedure is intended for updating TimeSheetDetail table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_TimeSheetDetail_Update]
	@nmTimeSheetDetail decimal,
	@szDetail varchar(max),
	@nmHourID decimal,
	@nmTimeSheetID decimal,
	@nmModule decimal,
	@nmProjectID decimal
As
Begin
	Update TimeSheetDetail
	Set
		[szDetail] = @szDetail,
		[nmHourID] = @nmHourID,
		[nmTimeSheetID] = @nmTimeSheetID,
		[nmModule] = @nmModule,
		[nmProjectID] = @nmProjectID
	Where		
		[nmTimeSheetDetail] = @nmTimeSheetDetail

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimeSheetDetail_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TimeSheetDetail_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_TimeSheetDetail_Insert
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:56:26 PM
-- Description:	This stored procedure is intended for inserting values to TimeSheetDetail table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_TimeSheetDetail_Insert]
	@szDetail varchar(max),
	@nmHourID decimal,
	@nmTimeSheetID decimal,
	@nmModule decimal,
	@nmProjectID decimal
As
Begin
	Insert Into TimeSheetDetail
		([szDetail],[nmHourID],[nmTimeSheetID],[nmModule],[nmProjectID])
	Values
		(@szDetail,@nmHourID,@nmTimeSheetID,@nmModule,@nmProjectID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserProjectSetting_SelectAll
-- Author:	Tarang Patel
-- Create date:	7/31/2009 12:07:19 PM
-- Description:	This stored procedure is intended for selecting all rows from UserProjectSetting table
-- ==========================================================================================
Create Procedure [dbo].[sp_UserProjectSetting_SelectAll]
As
Begin
	Select 
		[nmUserProjectSettingID],
		[nmProjectID],
		[nmModule],
		[nmUserID]
	From UserProjectSetting
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserProjectSetting_SelectRow
-- Author:	Tarang Patel
-- Create date:	7/31/2009 12:07:19 PM
-- Description:	This stored procedure is intended for selecting a specific row from UserProjectSetting table
-- ==========================================================================================
Create Procedure [dbo].[sp_UserProjectSetting_SelectRow]
	@nmUserProjectSettingID decimal
As
Begin
	Select 
		[nmUserProjectSettingID],
		[nmProjectID],
		[nmModule],
		[nmUserID]
	From UserProjectSetting
	Where
		[nmUserProjectSettingID] = @nmUserProjectSettingID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserProjectSetting_Insert
-- Author:	Tarang Patel
-- Create date:	7/31/2009 12:07:19 PM
-- Description:	This stored procedure is intended for inserting values to UserProjectSetting table
-- ==========================================================================================
Create Procedure [dbo].[sp_UserProjectSetting_Insert]
	@nmProjectID decimal,
	@nmModule decimal,
	@nmUserID decimal
As
Begin
	Insert Into UserProjectSetting
		([nmProjectID],[nmModule],[nmUserID])
	Values
		(@nmProjectID,@nmModule,@nmUserID)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserProjectSetting_Update
-- Author:	Tarang Patel
-- Create date:	7/31/2009 12:07:19 PM
-- Description:	This stored procedure is intended for updating UserProjectSetting table
-- ==========================================================================================
Create Procedure [dbo].[sp_UserProjectSetting_Update]
	@nmUserProjectSettingID decimal,
	@nmProjectID decimal,
	@nmModule decimal,
	@nmUserID decimal
As
Begin
	Update UserProjectSetting
	Set
		[nmProjectID] = @nmProjectID,
		[nmModule] = @nmModule,
		[nmUserID] = @nmUserID
	Where		
		[nmUserProjectSettingID] = @nmUserProjectSettingID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_UserProjectSetting_DeleteRow
-- Author:	Tarang Patel
-- Create date:	7/31/2009 12:07:19 PM
-- Description:	This stored procedure is intended for deleting a specific row from UserProjectSetting table
-- ==========================================================================================
Create Procedure [dbo].[sp_UserProjectSetting_DeleteRow]
	@nmUserProjectSettingID decimal
As
Begin
	Delete UserProjectSetting
	Where
		[nmUserProjectSettingID] = @nmUserProjectSettingID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProjectSetting_ByUserID]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UserProjectSetting_ByUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_UserProjectSetting_ByUserID]
@nmUserID INT
As
Begin
	Select 
		[nmUserProjectSettingID],
		[nmProjectID],
		[nmModule],
		[nmUserID]
	From UserProjectSetting
    WHERE nmUserID = @nmUserID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_AdminPermission_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/13/2009 12:46:47 PM
-- Description:	This stored procedure is intended for selecting all rows from AdminPermission table
-- ==========================================================================================
Create Procedure [dbo].[sp_AdminPermission_SelectAll]
As
Begin
	Select 
		[nmAdminPermission],
		[dtPermissionDate],
		[dtCreationDate],
		[nmUserID],
		[szPermission]
	From AdminPermission
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_AdminPermission_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/13/2009 12:46:47 PM
-- Description:	This stored procedure is intended for selecting a specific row from AdminPermission table
-- ==========================================================================================
Create Procedure [dbo].[sp_AdminPermission_SelectRow]
	@nmAdminPermission decimal
As
Begin
	Select 
		[nmAdminPermission],
		[dtPermissionDate],
		[dtCreationDate],
		[nmUserID],
		[szPermission]
	From AdminPermission
	Where
		[nmAdminPermission] = @nmAdminPermission
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_AdminPermission_Insert
-- Author:	Tarang Patel
-- Create date:	8/13/2009 12:46:47 PM
-- Description:	This stored procedure is intended for inserting values to AdminPermission table
-- ==========================================================================================
Create Procedure [dbo].[sp_AdminPermission_Insert]
	@dtPermissionDate datetime,
	@dtCreationDate datetime,
	@nmUserID decimal,
	@szPermission varchar(1)
As
Begin
	Insert Into AdminPermission
		([dtPermissionDate],[dtCreationDate],[nmUserID],[szPermission])
	Values
		(@dtPermissionDate,@dtCreationDate,@nmUserID,@szPermission)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_AdminPermission_Update
-- Author:	Tarang Patel
-- Create date:	8/13/2009 12:46:47 PM
-- Description:	This stored procedure is intended for updating AdminPermission table
-- ==========================================================================================
Create Procedure [dbo].[sp_AdminPermission_Update]
	@nmAdminPermission decimal,
	@dtPermissionDate datetime,
	@dtCreationDate datetime,
	@nmUserID decimal,
	@szPermission varchar(1)
As
Begin
	Update AdminPermission
	Set
		[dtPermissionDate] = @dtPermissionDate,
		[dtCreationDate] = @dtCreationDate,
		[nmUserID] = @nmUserID,
		[szPermission] = @szPermission
	Where		
		[nmAdminPermission] = @nmAdminPermission

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_AdminPermission_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/13/2009 12:46:47 PM
-- Description:	This stored procedure is intended for deleting a specific row from AdminPermission table
-- ==========================================================================================
Create Procedure [dbo].[sp_AdminPermission_DeleteRow]
	@nmAdminPermission decimal
As
Begin
	Delete AdminPermission
	Where
		[nmAdminPermission] = @nmAdminPermission

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Month]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Month]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_AdminPermission_Month]
	@StartDate Datetime,
    @EndDate DateTime
As
Begin
	Delete AdminPermission
	Where
		dtPermissionDate BETWEEN @StartDate AND @EndDate

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Select_Month]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Select_Month]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_AdminPermission_Select_Month]
	@StartDate Datetime,
    @EndDate DateTime
As
Begin
	Select * 
   FROM 
AdminPermission
	Where
		dtPermissionDate BETWEEN @StartDate AND @EndDate

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Delete_24Hours]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Delete_24Hours]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_AdminPermission_Delete_24Hours]
    @EndDate DateTime
As
Begin
	Delete AdminPermission
	Where
		dtCreationDate <= @EndDate

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminPermission_Select_UserWise]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AdminPermission_Select_UserWise]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_AdminPermission_Select_UserWise]
	@nmUserID INT
As
Begin
	Select dtPermissionDate
   FROM 
AdminPermission
	Where
		nmUserID = @nmUserID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Hours_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:37:20 PM
-- Description:	This stored procedure is intended for deleting a specific row from Hours table
-- ==========================================================================================
Create Procedure [dbo].[sp_Hours_DeleteRow]
	@nmHourID decimal
As
Begin
	Delete Hours
	Where
		[nmHourID] = @nmHourID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Hours_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:37:20 PM
-- Description:	This stored procedure is intended for selecting all rows from Hours table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_Hours_SelectAll]
@Search Varchar(50)
As
Begin
	Select 
		[nmHourID],
		[nmHourValue]
	From Hours
    WHERE 
      [nmHourValue] like @Search + ''%''
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Hours_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:37:20 PM
-- Description:	This stored procedure is intended for selecting a specific row from Hours table
-- ==========================================================================================
Create Procedure [dbo].[sp_Hours_SelectRow]
	@nmHourID decimal
As
Begin
	Select 
		[nmHourID],
		[nmHourValue]
	From Hours
	Where
		[nmHourID] = @nmHourID
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Hours_Insert
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:37:20 PM
-- Description:	This stored procedure is intended for inserting values to Hours table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_Hours_Insert]
	@nmHourValue decimal(5,2)
As
Begin
	Insert Into Hours
		([nmHourValue])
	Values
		(@nmHourValue)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Hours_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Hours_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Hours_Update
-- Author:	Tarang Patel
-- Create date:	8/7/2009 4:37:20 PM
-- Description:	This stored procedure is intended for updating Hours table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_Hours_Update]
	@nmHourID decimal,
		@nmHourValue decimal(5,2)
As
Begin
	Update Hours
	Set
		[nmHourValue] = @nmHourValue
	Where		
		[nmHourID] = @nmHourID

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Login]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_Login]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Procedure [dbo].[sp_Admin_Login]
	@szUserName varchar(100),
	@szPassword varchar(50)
As
Begin
	Select 
		[szUserName],
		[szPassword]
	From Admin
	Where
		[szUserName] = @szUserName
        AND [szPassword] = @szPassword
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_SelectAll]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Admin_SelectAll
-- Author:	Tarang Patel
-- Create date:	8/7/2009 3:58:45 PM
-- Description:	This stored procedure is intended for selecting all rows from Admin table
-- ==========================================================================================
Create Procedure [dbo].[sp_Admin_SelectAll]
As
Begin
	Select 
		[szUserName],
		[szPassword]
	From Admin
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_SelectRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_SelectRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Admin_SelectRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 3:58:45 PM
-- Description:	This stored procedure is intended for selecting a specific row from Admin table
-- ==========================================================================================
Create Procedure [dbo].[sp_Admin_SelectRow]
	@szUserName varchar(100)
As
Begin
	Select 
		[szUserName],
		[szPassword]
	From Admin
	Where
		[szUserName] = @szUserName
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Insert]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Admin_Insert
-- Author:	Tarang Patel
-- Create date:	8/7/2009 3:58:45 PM
-- Description:	This stored procedure is intended for inserting values to Admin table
-- ==========================================================================================
Create Procedure [dbo].[sp_Admin_Insert]
	@szUserName varchar(100),
	@szPassword varchar(50)
As
Begin
	Insert Into Admin
		([szUserName],[szPassword])
	Values
		(@szUserName,@szPassword)

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_Update]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Admin_Update
-- Author:	Tarang Patel
-- Create date:	8/7/2009 3:58:45 PM
-- Description:	This stored procedure is intended for updating Admin table
-- ==========================================================================================
Create Procedure [dbo].[sp_Admin_Update]
	@szUserName varchar(100),
	@szPassword varchar(50)
As
Begin
	Update Admin
	Set
		[szPassword] = @szPassword
	Where		
		[szUserName] = @szUserName

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_ChangePassword]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_ChangePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Procedure [dbo].[sp_Admin_ChangePassword]
	@szUserName varchar(50),
	@szPassword varchar(50)
	
As
Begin
	Update Admin
	Set		
		[szPassword] = @szPassword       
	Where		
		[szUserName] = @szUserName

End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Admin_DeleteRow]    Script Date: 09/09/2009 12:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Admin_DeleteRow]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ==========================================================================================
-- Entity Name:	sp_Admin_DeleteRow
-- Author:	Tarang Patel
-- Create date:	8/7/2009 3:58:45 PM
-- Description:	This stored procedure is intended for deleting a specific row from Admin table
-- ==========================================================================================
Create Procedure [dbo].[sp_Admin_DeleteRow]
	@szUserName varchar(100)
As
Begin
	Delete Admin
	Where
		[szUserName] = @szUserName

End

' 
END
GO
/****** Object:  ForeignKey [FK_AdminPermission_UserMaster]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AdminPermission_UserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[AdminPermission]'))
ALTER TABLE [dbo].[AdminPermission]  WITH CHECK ADD  CONSTRAINT [FK_AdminPermission_UserMaster] FOREIGN KEY([nmUserID])
REFERENCES [dbo].[UserMaster] ([nmUserID])
GO
/****** Object:  ForeignKey [FK__Module__nmProjec__3F466844]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Module__nmProjec__3F466844]') AND parent_object_id = OBJECT_ID(N'[dbo].[Module]'))
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK__Module__nmProjec__3F466844] FOREIGN KEY([nmProjectID])
REFERENCES [dbo].[Project] ([nmProjectID])
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmUse__3E52440B]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmUse__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheet]'))
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK__TimeSheet__nmUse__3E52440B] FOREIGN KEY([nmUserID])
REFERENCES [dbo].[UserMaster] ([nmUserID])
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmHou__3D5E1FD2]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmHou__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail]  WITH CHECK ADD  CONSTRAINT [FK__TimeSheet__nmHou__3D5E1FD2] FOREIGN KEY([nmHourID])
REFERENCES [dbo].[Hours] ([nmHourID])
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmMod__3B75D760]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmMod__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail]  WITH CHECK ADD  CONSTRAINT [FK__TimeSheet__nmMod__3B75D760] FOREIGN KEY([nmModule])
REFERENCES [dbo].[Module] ([nmModule])
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmPro__3A81B327]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmPro__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail]  WITH CHECK ADD  CONSTRAINT [FK__TimeSheet__nmPro__3A81B327] FOREIGN KEY([nmProjectID])
REFERENCES [dbo].[Project] ([nmProjectID])
GO
/****** Object:  ForeignKey [FK__TimeSheet__nmTim__3C69FB99]    Script Date: 09/09/2009 12:01:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TimeSheet__nmTim__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[TimeSheetDetail]'))
ALTER TABLE [dbo].[TimeSheetDetail]  WITH CHECK ADD  CONSTRAINT [FK__TimeSheet__nmTim__3C69FB99] FOREIGN KEY([nmTimeSheetID])
REFERENCES [dbo].[TimeSheet] ([nmTimeSheetID])
GO
/****** Object:  ForeignKey [FK_UserProjectSetting_Module]    Script Date: 09/09/2009 12:01:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProjectSetting_Module]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]'))
ALTER TABLE [dbo].[UserProjectSetting]  WITH CHECK ADD  CONSTRAINT [FK_UserProjectSetting_Module] FOREIGN KEY([nmModule])
REFERENCES [dbo].[Module] ([nmModule])
GO
/****** Object:  ForeignKey [FK_UserProjectSetting_Project]    Script Date: 09/09/2009 12:01:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProjectSetting_Project]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]'))
ALTER TABLE [dbo].[UserProjectSetting]  WITH CHECK ADD  CONSTRAINT [FK_UserProjectSetting_Project] FOREIGN KEY([nmProjectID])
REFERENCES [dbo].[Project] ([nmProjectID])
GO
/****** Object:  ForeignKey [FK_UserProjectSetting_UserMaster]    Script Date: 09/09/2009 12:01:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserProjectSetting_UserMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserProjectSetting]'))
ALTER TABLE [dbo].[UserProjectSetting]  WITH CHECK ADD  CONSTRAINT [FK_UserProjectSetting_UserMaster] FOREIGN KEY([nmUserID])
REFERENCES [dbo].[UserMaster] ([nmUserID])
GO
