//
//  AddNewWords.swift
//  Verbs.Hebrew
//
//  Created by Anton Rubenchik on 01/03/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//

import Foundation
class AddNewWords {
//        let newWordsArray : [BlackWord] = []
    //
  
    

    let newWordsArray : [BlackWord] = [
        BlackWord(translation  : "turn pale",
                  infinitive   : "לְהַחְוִירlehachvir",
                  presentMS    : "מַחֲווִירmachavir",
                  presentFS: "מַחֲווִירָהmachavira",
                  presentMP: "מַחֲווִירִיםmachavirim",
                  presentFP: "מַחֲווִירוֹתmachavirot",
                  past1S: "הֶחֱווַרְתִּיhechevarti",
                  past2MS: "הֶחֱווַרְתָּhechevarta",
                  past2FS: "הֶחֱווַרְתְּhechevart",
                  past3MS: "הֶחֱווִירhechevir",
                  past3FS: "הֶחֱווִירָהhechevira",
                  past1P: "הֶחֱווַרְנוּhechevarnu",
                  past2MP: "*הֶחֱווַרְתֶּםhechevartem",
                  past2FP: "*הֶחֱווַרְתֶּןhechevarten",
                  past3P: "הֶחֱווִירוּhecheviru",
                  future1S: "אַחֲווִירachavir",
                  future2MS: "תַּחֲווִירtachavir",
                  future2FS: "תַּחֲווִירִיtachaviri",
                  future3MS: "יַחֲווִירyachavir",
                  future3FS: "תַּחֲווִירtachavir",
                  future1P: "נַחֲווִירnachavir",
                  future2MP: "תַּחֲווִירוּtachaviru",
                  future2FP: "תַּחֲווִירוּtachaviru",
                  future3MP: "יַחֲווִירוּyachaviru",
                  future3FP: "יַחֲווִירוּyachaviru",
                  imperativeMS: "הַחֲווֵר!‏hachaver!",
                  imperativeFS: "הַחֲווִירִי!‏hachaviri!",
                  imperativeMP: "הַחֲווִירוּ!‏hachaviru!",
                  imperativeFP: "הַחֲווִירוּ!‏hachaviru!"),
    ]



    
    

   

   
    


   

    

   
    
   
    
    
    
    
    
    
    

   
   
    
    
    
    
    
    
    
    
  
    
   

}

/*
 let newWordsArray : [BlackWord] = [
 BlackWord(translation  : "ронять, склонять (голову); оставлять землю необработанной ",
 infinitive   : "לִשְׁמוֹטлишмот",
 presentMS    : "שׁוֹמֵטшомет",
 presentFS: "שׁוֹמֶטֶתшометет",
 presentMP: "שׁוֹמְטִיםшомтим",
 presentFP: "שׁוֹמְטוֹתшомтот",
 past1S: "שָׁמַטְתִּיшаматети",
 past2MS: "שָׁמַטְתָּшаматета",
 past2FS: "שָׁמַטְתְּшаматет",
 past3MS: "שָׁמַטшамат",
 past3FS: "שָׁמְטָהшамта",
 past1P: "שָׁמַטְנוּшаматну",
 past2MP: "*שְׁמַטְתֶּםшматетем",
 past2FP: "*שְׁמַטְתֶּןшматетен",
 past3P: "שָׁמְטוּшамту",
 future1S: "אֶשְׁמוֹטэшмот",
 future2MS: "תִּשְׁמוֹטтишмот",
 future2FS: "תִּשְׁמְטִיтишмети",
 future3MS: "יִשְׁמוֹטйишмот",
 future3FS: "תִּשְׁמוֹטтишмот",
 future1P: "נִשְׁמוֹטнишмот",
 future2MP: "תִּשְׁמְטוּтишмету",
 future2FP: "תִּשְׁמְטוּтишмету",
 future3MP: "יִשְׁמְטוּйишмету",
 future3FP: "יִשְׁמְטוּйишмету",
 imperativeMS: "שְׁמוֹט!‏шмот!",
 imperativeFS: "שִׁמְטִי!‏шимти!",
 imperativeMP: "שִׁמְטוּ!‏шимту!",
 imperativeFP: "שִׁמְטוּ!‏шимту!"),
 BlackWord(translation  : "быть разрушенным, покинутым (библ.)",
 infinitive   : "לָשׁוֹםлашом",
 presentMS    : "שׁוֹמֵםшомем",
 presentFS: "שׁוֹמֶמֶתшомемет",
 presentMP: "שׁוֹמְמִיםшомемим",
 presentFP: "שׁוֹמְמוֹתшомемот",
 past1S: "שָׁמַמְתִּיшамамти",
 past2MS: "שָׁמַמְתָּшамамта",
 past2FS: "שָׁמַמְתְּшамамт",
 past3MS: "שָׁמֵםшамем",
 past3FS: "שָׁמְמָהшамема",
 past1P: "שָׁמַמְנוּшамамну",
 past2MP: "*שְׁמַמְתֶּםшмамтем",
 past2FP: "*שְׁמַמְתֶּןшмамтен",
 past3P: "שָׁמְמוּшамему",
 future1S: "אֶשּׁוֹםэшом",
 future2MS: "תִּישּׁוֹםтишом",
 future2FS: "תִּישְּׁמִיтишми",
 future3MS: "יִישּׁוֹםйишом",
 future3FS: "תִּישּׁוֹםтишом",
 future1P: "נִישּׁוֹםнишом",
 future2MP: "תִּישְּׁמוּтишму",
 future2FP: "תִּישְּׁמוּтишму",
 future3MP: "יִישְּׁמוּйишму",
 future3FP: "יִישְּׁמוּйишму",
 imperativeMS: "שׁוֹם!‏шом!",
 imperativeFS: "שׁוֹמִּי!‏шоми!",
 imperativeMP: "שׁוֹמּוּ!‏шому!",
 imperativeFP: "שׁוֹמּוּ!‏шому!"),
 BlackWord(translation  : "жиреть, толстеть",
 infinitive   : "לִשְׁמוֹןлишмон",
 presentMS    : "שָׁמֵןшамен",
 presentFS: "שְׁמֵנָהшмена",
 presentMP: "שְׁמֵנִיםшменим",
 presentFP: "שְׁמֵנוֹתшменот",
 past1S: "שָׁמַנְתִּיшаманти",
 past2MS: "שָׁמַנְתָּшаманта",
 past2FS: "שָׁמַנְתְּшамант",
 past3MS: "שָׁמַןшаман",
 past3FS: "שָׁמְנָהшамна",
 past1P: "שָׁמַנּוּшаманну",
 past2MP: "*שְׁמַנְתֶּםшмантем",
 past2FP: "*שְׁמַנְתֶּןшмантен",
 past3P: "שָׁמְנוּшамну",
 future1S: "אֶשְׁמַןэшман",
 future2MS: "תִּשְׁמַןтишман",
 future2FS: "תִּשְׁמְנִיтишмени",
 future3MS: "יִשְׁמַןйишман",
 future3FS: "תִּשְׁמַןтишман",
 future1P: "נִשְׁמַןнишман",
 future2MP: "תִּשְׁמְנוּтишмену",
 future2FP: "תִּשְׁמְנוּтишмену",
 future3MP: "יִשְׁמְנוּйишмену",
 future3FP: "יִשְׁמְנוּйишмену",
 imperativeMS: "",
 imperativeFS: "",
 imperativeMP: "",
 imperativeFP: ""),
 BlackWord(translation  : "слышать; слушать",
 infinitive   : "לִשְׁמוֹעַлишмоа",
 presentMS    : "שׁוֹמֵעַшомеа",
 presentFS: "שׁוֹמַעַתшомаат",
 presentMP: "שׁוֹמְעִיםшомъим",
 presentFP: "שׁוֹמְעוֹתшомъот",
 past1S: "שָׁמַעְתִּיшамати",
 past2MS: "שָׁמַעְתָּшамата",
 past2FS: "שָׁמַעְתְּшамат",
 past3MS: "שָׁמַעшама",
 past3FS: "שָׁמְעָהшамъа",
 past1P: "שָׁמַעְנוּшаману",
 past2MP: "*שְׁמַעְתֶּםшмаатем",
 past2FP: "*שְׁמַעְתֶּןшмаатен",
 past3P: "שָׁמְעוּшамъу",
 future1S: "אֶשְׁמַעэшма",
 future2MS: "תִּשְׁמַעтишма",
 future2FS: "תִּשְׁמְעִיтишмеи",
 future3MS: "יִשְׁמַעйишма",
 future3FS: "תִּשְׁמַעтишма",
 future1P: "נִשְׁמַעнишма",
 future2MP: "תִּשְׁמְעוּтишмеу",
 future2FP: "תִּשְׁמְעוּтишмеу",
 future3MP: "יִשְׁמְעוּйишмеу",
 future3FP: "יִשְׁמְעוּйишмеу",
 imperativeMS: "שְׁמַע!‏шма!",
 imperativeFS: "שִׁמְעִי!‏шимъи!",
 imperativeMP: "שִׁמְעוּ!‏шимъу!",
 imperativeFP: "שִׁמְעוּ!‏шимъу!")
 ]
 */
