test_that("fatch_ssr works", {
  expect_s3_class({ssr <- fetch_ssr()}, "tbl_df")

  expected_names <- c(
    "id_row", "origin", "caseid", "docID", "hosCountry", "birthDate",
    "gender", "DCNumber", "ageOfChild", "resCountry", "resCity",
    "accDate", "accTime", "notKnownAccTime", "arrivalDate",
    "arrivalTime", "removalDate", "removalTime", "location",
    "specifyLocation", "anaesthesia", "death", "deathDate",
    "complication", "specifyComplication", "simptomLossCon",
    "simptomChoke", "simptomNausea", "simptomHypo", "simptomOdor",
    "simptomPurulental", "simptomDyspnea", "simptomDysphagia",
    "simptomBleed", "simptomPain", "simptomOther", "simptomSpecify",
    "complBrainDamage", "complPulmonarDamage", "complTissueDamage",
    "complTissueLesion", "complInfection", "complInvasiveProcedure",
    "complOther", "complSpecify", "objectRemovedNat", "FBremoved",
    "specifyFBremoved", "FBremovedOseophaRF", "FBremovedBroncoRF",
    "handicap", "specifyHandicap", "FBType", "FBTypeRecoded",
    "FBQuantity", "FBBrand", "FBShape", "specifyFBShape", "FBSharp",
    "FBConsistency", "copresence", "FBMaterial", "specifyFBMaterial",
    "FBColor", "cylinderTest", "purchasedFB", "purchasedPackagedFB",
    "purchasedPackagedFBType", "specifyPurchasedFBToy",
    "specifyPurchasedFBFood", "specifyPurchasedFBOther",
    "fb_packed_type_sp", "anotherObject", "anotherObjectType",
    "specifyAnotherObjectToy", "specifyAnotherObjectOther",
    "specifyAnotherObjectFood", "adultPresence", "adultPresence1",
    "adultPresence2", "adultPresence3", "adultPresenceAction",
    "accidentHappen", "specifyaccidentHappen", "accidentHappenHome",
    "accidentHappenOutside", "accidentAction", "specifyaccidentAction",
    "hospitalised", "initiallyLookedPre", "initiallyLookedPreEmRoom",
    "initiallyLookedPreGuideline", "initiallyLookedHospital",
    "initiallyLookedHospitalOrl", "initiallyLookedHospitalPaediatric",
    "initiallyLookedHospitalSurgery", "specifyinitiallyLookedHospital",
    "lasting", "comments", "submitDate", "img3d"
  )
  expect_named(ssr, expected_names)
})
