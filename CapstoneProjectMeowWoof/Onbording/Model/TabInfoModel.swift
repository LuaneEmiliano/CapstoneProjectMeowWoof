//
//  TabInfoModel.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 9/16/22.
//

import Foundation

struct TabInfoModel: Identifiable {
    var id = UUID()
    var name: String
    var color: String
}

var tabInfoList = [TabInfoModel(name: "MedicalRecord", color: "MedicalRecordsColor"),
                   TabInfoModel(name: "HealthJournal",color: "HealthJournalColor"),
                   TabInfoModel(name: "CareNotes", color: "CareNotes"),
                   TabInfoModel(name: "PetAlbum",color: "PetAlbum")]

