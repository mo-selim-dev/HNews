//
//  Results.swift
//  HNews
//
//  Created by Mohamed Selim on 04/11/2024.
/*
 هذا الكود يعرّف هيكلين (Structs) في Swift هما Results و Post. يستخدم هذان الهيكلان لفك تشفير بيانات JSON التي تأتي من الشبكة وتحويلها إلى كائنات Swift يمكن استخدامها في التطبيق.
 */
import Foundation

struct DecodedData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}


/*
 1. struct Results: Decodable

     •    Results: هو هيكل (struct) يمثل البيانات المسترجعة من استدعاء الـ API.
     •    Decodable: يشير إلى أن هذا الهيكل يمكن فك تشفيره من JSON باستخدام JSONDecoder. يعني ذلك أنه يمكن تحويل البيانات القادمة من الشبكة والتي تكون بصيغة JSON إلى كائن Results.

 الحقول في Results:

     •    hits: [Post]: هذه مصفوفة تحتوي على كائنات من نوع Post. كل عنصر في هذه المصفوفة يمثل مشاركة (post) من البيانات المسترجعة.

 2. struct Post: Decodable, Identifiable

     •    Post: هو هيكل يمثل كل مشاركة (post) مسترجعة من الـ API.
     •    Decodable: يعني أن هذا الهيكل يمكن فك تشفيره أيضًا من JSON.
     •    Identifiable: يُستخدم هذا البروتوكول عادةً مع SwiftUI. عندما يكون الهيكل متوافقًا مع هذا البروتوكول، يجب أن يحتوي على خاصية id فريدة تميز كل كائن عن الآخر، مما يسهل عرضه في قوائم SwiftUI.

 الحقول في Post:

     •    id: String: هذا الحقل هو معرف فريد لكل Post، ويُستخدم لتحديد كل مشاركة بشكل مميز.
     •    objectID: String: هذا هو المعرف الذي يتم الحصول عليه من JSON، ويُستخدم كقيمة للحقل id.
     •    تم استخدام خاصية محسوبة id بحيث تعيد قيمة objectID. هذا يوفر لـ SwiftUI معرفًا فريدًا لكل كائن Post.
     •    objectID: String: معرف فريد لكل مشاركة، وهو قادم من الـ API.
     •    points: Int: هذا الحقل يمثل عدد النقاط التي حصلت عليها المشاركة (مثل التقييم أو الإعجاب).
     •    title: String: هذا هو عنوان المشاركة.
     •    url: String?: هذا هو الرابط الخاص بالمشاركة. لاحظ أن نوعه هو String? مما يعني أنه اختياري (Optional)، أي أن الرابط قد يكون غير موجود.

 الخلاصة:

     •    Results يمثل النتيجة العامة التي تحتوي على عدة مشاركات (hits).
     •    Post يمثل كل مشاركة على حدة ويحتوي على معرّف فريد (objectID)، عدد النقاط، العنوان، وربما رابط (اختياري).
     •    Decodable يسمح لفك تشفير بيانات JSON القابلة للفهم، وتحويلها إلى كائنات Swift، في حين أن Identifiable يسهل العمل مع قوائم في SwiftUI باستخدام معرف فريد لكل كائن.
 */
