import 'package:flutter/widgets.dart';
import 'package:snap_n_eat/models/user.dart';

class DashBoardProvider with ChangeNotifier {
  String calorie = "Loading";
  String distance = "Loading";
  String floor = "Loading";
  String heartrate = "Loading";
  String steps = "Loading";
  String sleep = "Loading";
  String fullName = "Loading";
  String email = "Loading";
  String userId = "Loading";
  String gender = "";
  double rating = 0.0;
  double bmi = 0.0;
  double height;
  double weight;
  String avatar;
  User user;

  void setCalories(String calories) {
    this.calorie = calories;
    notifyListeners();
  }

  void setUserDetails(String fullName, String gender, String userId,
      String avatar, double height, double weight, double rating, double bmi) {
    this.fullName = fullName;
    this.gender = gender;
    this.height = height;
    this.weight = weight;
    this.userId = userId;
    this.avatar = avatar;
    this.rating = rating;
    this.bmi = bmi;
    user = new User(
        uid: userId,
        fullName: fullName,
        avatar: avatar,
        height: height,
        age: 0,
        gender: gender,
        weight: weight);
    notifyListeners();
  }

  void setDistance(String distance) {
    this.distance = distance;
    notifyListeners();
  }

  void setFloor(String floor) {
    this.floor = floor;
    notifyListeners();
  }

  void setHeartRate(String heartrate) {
    this.heartrate = heartrate;
    notifyListeners();
  }

  void setSteps(String steps) {
    this.steps = steps;
    notifyListeners();
  }

  void setSleep(String sleep) {
    this.sleep = sleep;
    notifyListeners();
  }

  List<String> logo = [
    'assets/icons/logo.png',
    'assets/icons/deadline.png',
    'assets/icons/edit.png',
    'assets/icons/message.png',
    'assets/icons/payslip.png',
    'assets/icons/refund.png',
    'assets/icons/health.png'
  ];

  List<String> insuranceName = [
    'Individual Insurance',
    'Family Floater Insurance',
    'Top-up Insurance',
    'Critical Illness Insurance',
    'Group/Employee Insurance',
    'Personal Accident Covers',
    'Maternity Insurance'
  ];

  Map<String, dynamic> description = {
    'Individual Insurance':
    {'description': 'Each individual is different and so are their medical needs. Consider taking an individual health insurance for yourself and each member of your family. With Bajaj Finserv’s Individual Health Insurance plan offerings, get coverage for expenses incurred due to hospitalization, doctor’s consultation, ambulance services, treatment charges or pre- and post-hospitalization.',
    'benefits': ['Sum insured up to Rs.50 lakh', 'Medical tests exemption', 'Comprehensive coverage', 'Enjoy various discounts'],
    'eligibility':'The following Bajaj Finserv loan customers can be covered under Bajaj Finserv’s Individual Health Insurance Plan offerings: \nYou should be between 18 years to 65 years of age. \nThe policy can be renewed for a lifetime.The entry age for a child is 3 months and goes up to 30 years.'},
    'Family Floater Insurance':
    {'description': 'Cover your loved ones against any kind of illness or accident with a Family Health Insurance plan. Pay one single premium and provide a health insurance for yourself, your spouse and your kids. Pay for the hospitalization charges, consultation fees, and even medicines with a comprehensive cover from Bajaj Finserv’s Family Health Insurance plan offerings. Save time and money with a hassle-free medical coverage for your entire family.',
    'benefits': ['Coverage up to Rs.50 lakh','Hassle-free', 'Save tax', 'Add a member easily'],
    'eligibility': 'A Bajaj Finserv loan customer is eligible for a family health insurance plan if the family members are between the age of 18 to 65 years and the age of dependent children should be between 3 months to 30 years.'},
    'Top-up Insurance':
    {'description': 'Is your existing health insurance policy not sufficient to cover the medical bills? Get an additional health coverage with Top-Up Health Insurance from Bajaj Finserv. Get a wider health protection for yourself and your family against any kind of illness or accidents. Get an extra coverage against rising medical costs by just paying an affordable premium amount.',
    'benefits': ['Additional coverage', 'Sum insured up to Rs.50 lakh', 'Floater coverage', 'Customized features'],
    'eligibility': 'As a Bajaj Finserv loan customer, getting a top-up health insurance is easy and fast. The policyholder and spouse should be between 18 to 70 years. Dependent children between 3 months to 18 years can be covered if both the parents are insured with us. Individuals from 18 years to 25 years can be covered as self-proposer or as dependents, if both parents are insured with us.'},
    'Critical Illness Insurance':
    {'description': 'Critical Illness is never good news. A heart attack, organ transplant, stroke, cancer, or anything which can be life-threatening, need extra care and attention. Thus, a Critical Illness Insurance is recommended to cover the huge financial expenses during such stressful times. With Bajaj Finserv’s Critical Illness Insurance plan, get a lump sum amount of up to Rs.50 lakh for the medical treatment of critical illnesses.',
    'benefits': ['Cover up to Rs.50 lakh','Lump Sum Payment','Comprehensive usage', 'Covers major illnesses'],
    'eligibility': 'If you are a Bajaj Finserv’s loan customer and looking for a critical illness health insurance, you are at the right place. To avail this policy, you should be Between the age of 18 to 65 years.'},
    'Group/Employee Insurance':
    {'description': 'Get a healthier workforce by taking a health cover for a group of people or your employees. Simply pay a single premium amount and secure your employees against medical emergencies. Enjoy higher discounts and more benefits with Group Health Insurance plans on our website. Cover the medical expenses of your group members as well as their dependents. Enjoy the hassle-free claims for medical expenses with cashless facility and easy reimbursement for hospitalization expenses.',
    'benefits': ['Medical benefits', 'Cover dependents', 'Save time and money', 'Cashless claims'],
    'eligibility': 'If you are a Bajaj Finserv’s loan customer, you can get a group health insurance in a jiffy. You should be an employer or an employee group to take a group health insurance policy.'},
    'Personal Accident Covers':
    {'description': 'Accidents are uncertain and unfortunate. So, get a cover for life’s unexpected events with Bajaj Finserv’s Personal Accident Insurance. Get a financial coverage against bodily injury, disability, or death caused due to accidents. Cover your hospital bills and get a hospital confinement allowance as a compensation for your loss of running income.',
    'benefits': ['Stay financially secure', 'Medical expenses covered', 'Hospital confinement allowance', 'Children education bonus'],
    'eligibility': 'If you are Bajaj Finserv’s loan customer you can easily get a Personal Accident Insurance. To apply for this plan, you need to be between the age of 18 to 65 years and dependents must be between the age of 5 to 21 years.'},
    'Maternity Insurance':
    {'description': 'Bringing a new life to the world is a big responsibility. Take the Maternity Health Insurance and cover all pregnancy-related expenses. Be it a normal delivery or a caesarean- all pre-natal and post-natal expenses, post-delivery care, and vaccinations are covered under Maternity Health Insurance. Choose a comprehensive Maternity Health Insurance from Bajaj Finserv and get the best medical facilities during and after pregnancy.',
    'benefits': ['Comprehensive coverage', 'Newborn care', 'Easy online application', 'Ambulance charges'],
    'eligibility': 'These expenses are not covered by Maternity Health Insurance, Follow-up diagnostic tests during nine months of pregnancy \n Tonics and vitamins for the mother or baby (unless part of a treatment). \n The doctor’s consultation fee for a routine check-up.'}
  };


  List<String> getLogo() {
    return logo;
  }

  List<String> getInsurance() {
    return insuranceName;
  }

  Map<String, dynamic> getDesription() {
    return description;
  }
}
