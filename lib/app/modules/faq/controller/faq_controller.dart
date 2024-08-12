import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

import '../view/faq_view.dart';

class FaqController extends BaseController {

  var faqItems = <FAQItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFAQItems();
  }

  void loadFAQItems() {
    faqItems.value = List.generate(4, (index) => FAQItem(
      question: 'What is the question $index?',
      answer: 'There is no valid question. So the answer can\'t help you.',
    ));
  }

  void toggleExpansion(int index) {
    faqItems[index].isExpanded = !faqItems[index].isExpanded;
    faqItems.refresh();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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


