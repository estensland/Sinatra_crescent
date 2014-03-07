# create a relation table
# create a relationship (join relations) table
# create a notes table
# create a faction table
# create a adherents (join factions) table
# create a birth table (date and the level of certainty)
# create a death table (date and the level of certainty)

User.create(user_name: "Stens", email: "stens688@gmail.com", password: "1234", password_confirmation: "1234")

Title.create(user_id: 1, position: "Caliph") #1
Title.create(user_id: 1, position: "Govenor")
Title.create(user_id: 1, position: "Chief") #3
Title.create(user_id: 1, position: "Commander")
Title.create(user_id: 1, position: "General") #5

Scope.create(user_id: 1, area: "The Umayyad Caliphate") #1
Scope.create(user_id: 1, area: "The Abbasid Caliphate")
Scope.create(user_id: 1, area: "Disputed Claims")
Scope.create(user_id: 1, area: "Khurasan")
Scope.create(user_id: 1, area: "Syria") #5
Scope.create(user_id: 1, area: "Iraq")
Scope.create(user_id: 1, area: "Fars")
Scope.create(user_id: 1, area: "Homs")
Scope.create(user_id: 1, area: "Damascus")
Scope.create(user_id: 1, area: "Merv") #10

Relation.create(user_id: 1, name: "Father")
Relation.create(user_id: 1, name: "Mother")
Relation.create(user_id: 1, name: "Mawali")
Relation.create(user_id: 1, name: "Servant")
Relation.create(user_id: 1, name: "Slave")
Relation.create(user_id: 1, name: "Ally")

Ethnicity.create(user_id: 1, name: "Arab")
Ethnicity.create(user_id: 1, name: "Persian")
Ethnicity.create(user_id: 1, name: "Khurasani")
Ethnicity.create(user_id: 1, name: "Turkic")

Ethnicity.create(user_id: 1, name: "Banu Yaman") #5
Ethnicity.create(user_id: 1, name: "Banu Kalb")
Ethnicity.create(user_id: 1, name: "Banu Quda'a")
Ethnicity.create(user_id: 1, name: "Banu Judham")
Ethnicity.create(user_id: 1, name: "Banu Kalb")
Ethnicity.create(user_id: 1, name: "Banu Azd") #10
Ethnicity.create(user_id: 1, name: "Banu 'Amir")
Ethnicity.create(user_id: 1, name: "Banu Balqayn")
Ethnicity.create(user_id: 1, name: "Banu Kindah")
Ethnicity.create(user_id: 1, name: "Banu Sakasic")
Ethnicity.create(user_id: 1, name: "Banu Lakhm") #15
Ethnicity.create(user_id: 1, name: "Banu Hamdan")
Ethnicity.create(user_id: 1, name: "Banu Tay")
Ethnicity.create(user_id: 1, name: "Banu Ghassanids")
Ethnicity.create(user_id: 1, name: "Banu Khurza'a")

Ethnicity.create(user_id: 1, name: "Banu Mudar") #20
Ethnicity.create(user_id: 1, name: "Banu Rabi'a")
Ethnicity.create(user_id: 1, name: "Banu Qays")
Ethnicity.create(user_id: 1, name: "Banu Khaybar")
Ethnicity.create(user_id: 1, name: "Banu Tamim")
Ethnicity.create(user_id: 1, name: "Banu Layth") #25
Ethnicity.create(user_id: 1, name: "Banu Shayban")
Ethnicity.create(user_id: 1, name: "Banu Quraysh") #27
Ethnicity.create(user_id: 1, name: "Banu Hashim")
Ethnicity.create(user_id: 1, name: "Ahl al-Bayt")
Ethnicity.create(user_id: 1, name: "Banu Umayya") #30
Ethnicity.create(user_id: 1, name: "Banu Abbas")
Ethnicity.create(user_id: 1, name: "Banu 'Ijl")
Ethnicity.create(user_id: 1, name: "Banu Taghlib")

Faction.create(user_id: 1, name: "Syrian Yamani") #1
Faction.create(user_id: 1, name: "Syrian Mudari") #2

Faction.create(user_id: 1, name: "Khariji")
Faction.create(user_id: 1, name: "Murji'a")
Faction.create(user_id: 1, name: "Abbasid")
Faction.create(user_id: 1, name: "Iraqi Hashimiyya")
Faction.create(user_id: 1, name: "Khurasani Hashimiyya")
Faction.create(user_id: 1, name: "Mainstream Shi'a")
Faction.create(user_id: 1, name: "Ghu'lat Shi'a")



ClassicalMuslim.create(user_id: 1, ism: "al_Abbas", laqab: nil, nisbah: nil, nasab: "ibn al-Walid ibn 'Abd al-Malik",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 1, content: "He was the head of Banu Marwan when his brother of Yazid III led his coup against al-Walid II. While al-Abbas at first tries to convince Yazid’s against rebellion, he joined Yazid’s supporters before al-Walid II was killed.")
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 1, ethnicity_id: 1) # ARAB
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 1, ethnicity_id: 20) # BANU MUDAR
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 1, ethnicity_id: 27) # BANU QURAYSH
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 1, ethnicity_id: 30) # BANU UMAYYA
  Adherent.create(user_id: 1, classical_muslim_id: 1, faction_id: 1) 

ClassicalMuslim.create(user_id: 1, ism: nil, laqab: nil, nisbah: "al-Sufyani", nasab: "ibn ‘Abdallah ibn Yazid ibn Mu’awiya",  kunya: "Abu Muhammad")
 Description.create(table: "classical_muslims", user_id: 1, parent_id: 2,  content: "The people of Homs rallied around him against Yazid III’s rule, but he was defeated and imprisoned. He survived the panic in Damascus as Marwan II approached, and in one account delivered the wish of al-Walid II’s heir that Marwan be Caliph if he should die. He participated later in a revolt in Syria against Abbasid rule.")
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 2, ethnicity_id: 1) # Arab
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 2, ethnicity_id: 20) # BANU MUDAR
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 2, ethnicity_id: 27) # BANU QURAYSH
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 2, ethnicity_id: 30) # BANU UMAYYA
  Adherent.create(user_id: 1, classical_muslim_id: 2, faction_id: 2) 


ClassicalMuslim.create(user_id: 1, ism: "‘Abdallah", laqab: nil, nisbah: nil, nasab: "ibn ‘Umar ",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 3, content: "Yazid III’s second governor of Iraq, replacing Mansur b. Jumhur. He at first tried to keep Hashimite ‘Abdallah b. Mu’awiya as an ally when Marwan marched on Syria, but Ibn Mu’awiya gained support and rebelled in Kufa. He allowed the rebels to leave as he and his largely Yamani following had to face Marwan's appointed but Mudari-backed governor of Iraq.. He and his supporters joined the Khariji rebels to unite against Marwan, until they were defeated by the Caliph. He was captured, and according to reports about the death of the Abbasid Ibrahim al-Imam, taken to prison in Harran where he died around the same time as Ibrahim.")
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 3, ethnicity_id: 1) # Arab
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 3, ethnicity_id: 20) # BANU MUDAR
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 3, ethnicity_id: 27) # BANU QURAYSH
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 3, ethnicity_id: 30) # BANU UMAYYA
  Adherent.create(user_id: 1, classical_muslim_id: 3, faction_id: 1) 

ClassicalMuslim.create(ism: "‘Abd al-‘Aziz", laqab: nil, nisbah: nil, nasab: "ibn al-Hajjaj",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 4, content: "Supported Yazid III’s coup and led Yazid’s army to victory against al-Walid II. When Homs did not give the oath to Ibrahim he sieged it, only to be defeated by Marwan on the latter’s way to Damascus. During the fall of Damascus, ‘Abd al-‘Aziz was killed by a mawla of al-Walid II.")
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 4, ethnicity_id: 1) # Arab
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 4, ethnicity_id: 20) # BANU MUDAR
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 4, ethnicity_id: 27) # BANU QURAYSH
  EthnicIdentity.create(user_id: 1, classical_muslim_id: 4, ethnicity_id: 30) # BANU UMAYYA
  Adherent.create(user_id: 1, classical_muslim_id: 4, faction_id: 1) 


ClassicalMuslim.create(user_id: 1, ism: "‘Abd ar-Rahman", laqab: nil, nisbah: nil, nasab: "ibn Mu’awiya ibn Hisham",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 5, content: "Nephew of Sulayman b. Hisham who escaped to al-Andalus, where he was declared Emir after taking over with the support of Yamanis there over those of Banu Qays. He was dubbed “Falcon of the Quraysh” by Abbasid Caliph al-Mansur after the Abbasids were unable to take al-Andalus from ‘Abd ar-Rahman and his supporters.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 5, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 5, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 5, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 5, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 5, faction_id: 1) 


ClassicalMuslim.create(user_id: 1, ism: "al-Abrash", laqab: nil, nisbah: nil, nasab: "ibn al-Walid",  kunya: nil)
   Description.create(table: "classical_muslims", user_id: 1, parent_id: 6, content: "Along with Sulayman b. Hisham, he asked Marwan to seek a peaceful resolution to the revolt of Banu Kalb at Thadmur. He convinced the Kalb to submit to Marwan, though some fled into the desert.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 6, ethnicity_id: 1) # ARAB
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 6, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 6, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 6, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 6, faction_id: 1) 

ClassicalMuslim.create(user_id: 1, ism: "Bishr", laqab: nil, nisbah: nil, nasab: "ibn al-Walid",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 7, content: "The Qaysis in his army under Ibn Hubayrah defected to Marwan when he attempted to block Marwan’s route to his brother, Ibrahim, in Damascus.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 7, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 7, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 7, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 7, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 7, faction_id: 1) 


ClassicalMuslim.create(user_id: 1, ism: "Ibrahim", laqab: nil, nisbah: nil, nasab: "ibn al-Walid",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 8, content: "He was named successor to the Caliphate by his brother Yazid III, however, his rule was not widely recognized. He soon was effectively deposed by Marwan II. At first he fled the armies of Marwan, but was later granted amnesty and stayed loyal until his death in the Battle of the Zab against the Abbasid.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 8, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 8, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 8, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 8, ethnicity_id: 30) # BANU UMAYYA
    Position.create(user_id: 1, title_id: 1, classical_muslim_id: 8, scope_id: 1, start_date: "744", end_date: "744") #UMAYYAD CALIPH
    Adherent.create(user_id: 1, classical_muslim_id: 8, faction_id: 1) 
    Adherent.create(user_id: 1, classical_muslim_id: 8, faction_id: 2) 


ClassicalMuslim.create(user_id: 1, ism: "Hisham", laqab: nil, nisbah: nil, nasab: "ibn ‘Abd al-Malik",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 9, content: "He reigned from 723-743, and saw Umayyad military expansion stagnate after multiple defeats on the borders. The Syro-Jaziran imperial army became extremely as a result of these defeats in addition to internal rebellions. Hisham attempted to replace al-Walid II as the successor, but he died before he could. Those who had attempted to help him received al-Walid’s ire, setting the stage for the Third Fitna." )
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 9, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 9, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 9, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 9, ethnicity_id: 30) # BANU UMAYYA
    Position.create(user_id: 1, title_id: 1, classical_muslim_id: 9, scope_id: 1, start_date: "723", end_date: "743") #UMAYYAD CALIPH
    Relationship.create(user_id: 1, subject_id: 9, object_id: 13, relation_id: 1)



ClassicalMuslim.create(user_id: 1, ism: "Marwan", laqab: nil, nisbah: nil, nasab: "ibn Muhammad",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 10, content: "He was the last Umayyad caliph, ruling from 744-750. He was from a lesser branch of Banu Marwan, and did not expect to become caliph. He was a successful general, finding victories in the Caucuses. Despite originally marching to overthrow Yazid III after the latter’s coup, he was bought off when Yazid gave him the Jazira, Mosul, Armenia, and Azerbaijan to govern. However, once Yazid died Marwan took overthrew Ibrahim and became Caliph. He began his reign rather conciliatory, allowing Syrian garrisons to elect their own governors, but after multiple revolts by those who he had shown mercy to, Marwan became more punitive. In the end, he subdued from Syria to Iran, but his armies failed before the revolutionary Khurasanis. He was defeated at the Battle of the Zab, but he escaped, fleeing until he finally was hunted down in Upper Egypt.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 10, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 10, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 10, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 10, ethnicity_id: 30) # BANU UMAYYA
    Position.create(user_id: 1, title_id: 1, classical_muslim_id: 10, scope_id: 1, start_date: "745", end_date: "750") #UMAYYAD CALIPH
    Adherent.create(user_id: 1, classical_muslim_id: 10, faction_id: 2) 



ClassicalMuslim.create(user_id: 1, ism: "Masrur", laqab: nil, nisbah: nil, nasab: "ibn al-Walid ibn 'Abd al-Malik",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 11, content: "He lead the army on Homs for his brother Yazid III, but was captured with Bishr b. al-Walid when the Qaysi element under Ibn Hubayrah defeated to .......")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 11, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 11, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 11, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 11, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 11, faction_id: 1) 


ClassicalMuslim.create(user_id: 1, ism: "Sa’id", laqab: nil, nisbah: nil, nasab: "ibn Hisham ibn ‘Abd al-Malik",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 12, content: "Commanded Homs for his brother, Sulayman, when the latter fled the advance of Marwan’s army. People inside Homs eventually betray him to Marwan in exchange for their safety, and Sa’id was taken to prisoner with his sons to Harran. There he joined Ibrahim al-Imam and ‘Abdallah b. ‘Umar. Reports are numerous, but one claims he escaped from prison only to be killed by the people of Harran.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 12, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 12, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 12, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 12, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 12, faction_id: 1) 


ClassicalMuslim.create(user_id: 1, ism: "Sulayman", laqab: nil, nisbah: nil, nasab: "ibn Hisham ibn ‘Abd al-Malik",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 13, content: "He was lashed by al-Walid II before being imprisoned. He was freed and joined Yazid III’s army after the latter took Damascus. While he fled when Marwan came to depose Ibrahim, he later received safety from the new Caliph and stayed with Marwan’s force. Later he broke his word and revolted. Reports differ, but he either returned to Homs or fled to join the Khawarij. From there he joined the Hashemite ‘Abdallah b. Mu’awiya, until the latter’s defeat. Eventually, he fled to Sind.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 13, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 13, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 13, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 13, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 13, faction_id: 1, start_date: "The struggle between his father and al-Walid", end_date: "The Fall of Damascus to Marwan") 
    Adherent.create(user_id: 1, classical_muslim_id: 13, faction_id: 2, start_date: "Marwan squashing the Yamani Syrian Rebellion", end_date: "As Soon as Marwan Left For Iraq") 
    Adherent.create(user_id: 1, classical_muslim_id: 13, faction_id: 1, start_date: "As Soon as Marwan Left For Iraq" ) 
    Position.create(user_id: 1, title_id: 1, classical_muslim_id: 13, scope_id: 3, start_date: "745", end_date: "750") #UMAYYAD CALIPH



ClassicalMuslim.create(user_id: 1, ism: "Yazid", laqab: nil, nisbah: nil, nasab: "ibn al-Walid",  kunya: nil)

    EthnicIdentity.create(user_id: 1, classical_muslim_id: 14, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 14, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 14, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 14, ethnicity_id: 30) # BANU UMAYYA
    Position.create(user_id: 1, classical_muslim_id: 14, title_id: 1, scope_id: 1, start_date: "744", end_date: "744") #UMAYYAD CALIPH
    Adherent.create(user_id: 1, classical_muslim_id: 14, faction_id: 1) 


ClassicalMuslim.create(user_id: 1, ism: "al-Walid", laqab: nil, nisbah: nil, nasab: "ibn Mu’awiya ibn Marwan",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 15, content: "He was chosen by the people of Jordan after Marwan took Damascus.")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 15, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 15, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 15, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 15, ethnicity_id: 30) # BANU UMAYYA
    Adherent.create(user_id: 1, classical_muslim_id: 15, faction_id: 2) 


ClassicalMuslim.create(user_id: 1, ism: "al-Walid", laqab: nil, nisbah: nil, nasab: "ibn Yazid ibn ‘Abd al-Malik",  kunya: nil)
  Description.create(table: "classical_muslims", user_id: 1, parent_id: 16, content: "He was the caliph from 743-744, and is mostly portrayed as irreligious, going as far as to get drunk inside the Ka’ba. Caliph Hisham had tried to bypass him in the order of succession, but had failed before he died. Al-Walid then acted with a vengeance on those who had helped Hisham in this failed attempt, including Yamanis and Umayyads including Sulayman b. Hisham. These tensions with Yamanis and his Umayyad-kin boiled over by allowing Yamani Khalid b. ‘Abdallah al-Qasri to be tortured to death by Mudari Yusuf b. ‘Umar. The Yamani coup killed him and....")
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 16, ethnicity_id: 1) # Arab
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 16, ethnicity_id: 20) # BANU MUDAR 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 16, ethnicity_id: 27) # BANU QURAYSH 
    EthnicIdentity.create(user_id: 1, classical_muslim_id: 16, ethnicity_id: 30) # BANU UMAYYA
    Position.create(user_id: 1, title_id: 1, classical_muslim_id: 15, scope_id: 1, start_date: "745", end_date: "750") #UMAYYAD CALIPH
    Adherent.create(user_id: 1, classical_muslim_id: 16, faction_id: 1) 


