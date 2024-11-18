 //
//  WebView.swift
//  HNews
//
//  Created by Mohamed Selim on 04/11/2024.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let urlf = URL(string: safeString) {
                let request = URLRequest(url: urlf)
                uiView.load(request)
            }
        }
    }
    
}



/*
 هذا الكود يقوم بتعريف هيكل WebView الذي يستخدم لعرض صفحات الويب داخل تطبيق SwiftUI باستخدام WKWebView (مكون من مكتبة WebKit لعرض محتوى الويب). يعتمد هذا الهيكل على بروتوكول UIViewRepresentable لتضمين واجهة UIKit (أي WKWebView) في بيئة SwiftUI.

 الشرح المفصل للكود:

 1. import Foundation و import WebKit و import SwiftUI:

     •    Foundation: مكتبة أساسية تحتوي على العديد من الأدوات المفيدة (مثل التعامل مع النصوص والتواريخ).
     •    WebKit: مكتبة تتيح لك استخدام WKWebView لعرض محتوى الويب (مثل الصفحات الإلكترونية).
     •    SwiftUI: مكتبة لتصميم واجهات المستخدم التفاعلية في iOS باستخدام لغة Swift.

 2. struct WebView: UIViewRepresentable:

     •    WebView: هو هيكل يستخدم UIViewRepresentable لتمكين التكامل بين UIKit (التي تعتمد على UIView) و SwiftUI (التي تعتمد على واجهات View).
     •    UIViewRepresentable: هذا البروتوكول يسمح بدمج عناصر UIKit في SwiftUI. عند استخدامه، يجب عليك توفير دالتين: makeUIView و updateUIView.

 3. let urlString: String?:

     •    urlString: هو نص اختياري يمثل عنوان URL للصفحة الإلكترونية التي تريد عرضها. كونه اختياريًا يعني أنه يمكن أن يكون nil إذا لم يكن هناك رابط متاح.

 4. func makeUIView(context: Context) -> WKWebView:

     •    هذه الدالة مطلوبة من بروتوكول UIViewRepresentable. تُستخدم لإنشاء WKWebView، وهو مكون عرض صفحات الويب.
     •    يتم استدعاء هذه الدالة مرة واحدة عند إنشاء الـ WebView لأول مرة.
     •    WKWebView(): تقوم بإنشاء وإرجاع كائن WKWebView الذي سيتم عرضه في الواجهة.

 5. func updateUIView(_ uiView: WKWebView, context: Context):

     •    هذه الدالة مطلوبة أيضًا من بروتوكول UIViewRepresentable. تُستخدم لتحديث الـ WKWebView الموجود بالفعل.
     •    uiView: يمثل الـ WKWebView الذي تم إنشاؤه مسبقًا (من خلال makeUIView).
     •    هنا، يتم تحميل عنوان URL في الـ WKWebView:
     •    أولاً، يتم التحقق من أن urlString ليس فارغًا (nil).
     •    بعد ذلك، يتم محاولة تحويل هذا النص إلى كائن URL. إذا كان التحويل ناجحًا، يتم إنشاء طلب HTTP باستخدام URLRequest وتحميله في WKWebView.

 6. if let safeString = urlString:

     •    هذه الجملة تتحقق من أن urlString يحتوي على قيمة غير فارغة. إذا كانت القيمة موجودة، يتم متابعة الكود.

 7. if let url = URL(string: safeString):

     •    بعد التأكد من أن urlString يحتوي على قيمة، يتم محاولة تحويل هذه القيمة النصية إلى كائن URL. إذا كان الرابط صالحًا (أي أنه يمكن تكوين كائن URL منه)، يتم تنفيذ الكود التالي.

 8. let request = URLRequest(url: url):

     •    URLRequest: يُستخدم لإنشاء طلب لتحميل محتوى من عنوان URL معين. هنا يتم استخدامه لتحميل الصفحة من الرابط الذي تم تكوينه.

 9. uiView.load(request):

     •    يتم تحميل الطلب (الذي يحتوي على الرابط) في الـ WKWebView، مما يؤدي إلى عرض الصفحة في الـ WebView.

 الخلاصة:

     •    WebView هو مكون SwiftUI يعرض محتوى الويب باستخدام WKWebView من مكتبة WebKit.
     •    يتم تمرير عنوان URL كقيمة اختيارية urlString. إذا كان الرابط صالحًا، يتم تحميل الصفحة داخل التطبيق.
     •    الكود يجمع بين SwiftUI و UIKit باستخدام UIViewRepresentable، مما يتيح لك دمج واجهات UIKit (مثل WKWebView) في تطبيق مبني على SwiftUI.

 */

/*
 يمكنك استخدام WebView في SwiftUI لعرض صفحة ويب مثل:

 struct ContentView: View {
     var body: some View {
         WebView(urlString: "https://www.example.com")
     }
 }
 
 في هذا المثال، سيتم عرض صفحة الويب الخاصة بـ “example.com” في تطبيق SwiftUI.
 */
