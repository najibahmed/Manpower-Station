
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

class HelpController extends BaseController {


  var faqItems = <FAQItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFAQItems();
  }

  void loadFAQItems() {
    faqItems.value=[
      FAQItem(question: 'How can I hire a housemaid from ManPower Station?',
          answer: "1: Choose your desired service, fill in your requirements and make a booking on our platform.\n"
              "2: Confirm your requirements with the relationship manager assigned to you.\n"
              "3: Sit tight while our relationship manager finds the right fit for your home."
      ),FAQItem(question: 'What if I’m not satisfied with the services??',
          answer: "While all our helpers undergo an intensive verification regime before being certified as a ManPower, "
              "we still believe that there’s always room for improvement. "
              "In order to ensure that you obtain the optimum fit for your home, "
              "we provide an ‘unlimited replacement’ policy as part of your membership. "
              "Just reach out to your relationship manager or mail us at support@manpowerstation.com."

      ),FAQItem(question: 'Why do your services seem more expensive than other helpers in the market?',
          answer: "Unlike maid services/agencies we don’t charge a hefty commission fee from our clients, "
              "just a nominal booking amount. The entire wage as estimated by our wage estimation matrix(based on the Minimum Wages Act Of 1948) is paid in full to the helper."
      ),FAQItem(question: 'Is a maid/cook/babysitter from ManPowerStation reliable?',
          answer: "Every ManPower helper goes through a thorough background check using their NID and police records, "
              "and is only sent to your homes after a successful vetting process."
      ),
    ];
    // faqItems.value = List.generate(4, (index) => FAQItem(
    //   question: 'What is the question $index?',
    //   answer: 'There is no valid question. So the answer can\'t help you.',
    // ));
  }

  void toggleExpansion(int index) {
    faqItems[index].isExpanded = !faqItems[index].isExpanded;
    faqItems.refresh();
  }

}

class FAQItem {
  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  String question;
  String answer;
  bool isExpanded;
}