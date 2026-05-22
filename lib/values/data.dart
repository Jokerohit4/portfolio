part of values;

class OziFeatureData {
  final String feature;
  final String timeToDeliver;
  final String quality;
  final String impact;

  const OziFeatureData({
    required this.feature,
    required this.timeToDeliver,
    required this.quality,
    required this.impact,
  });
}

class ProjectDetailData {
  final String projectId;
  final String title;
  final String company;
  final String shortDescription;
  final String detailedDescription;
  final List<String> keyFeatures;
  final List<String> impact;
  final List<String> technologies;
  final String? downloadLink;
  final String? websiteLink;

  const ProjectDetailData({
    required this.projectId,
    required this.title,
    required this.company,
    required this.shortDescription,
    required this.detailedDescription,
    required this.keyFeatures,
    required this.impact,
    required this.technologies,
    this.downloadLink,
    this.websiteLink,
  });
}

class TestimonialData {
  final String name;
  final String role;
  final String company;
  final String quote;
  final String? imageUrl;

  const TestimonialData({
    required this.name,
    required this.role,
    required this.company,
    required this.quote,
    this.imageUrl,
  });
}

class ArticleData {
  final String title;
  final String description;
  final String category;
  final String? externalUrl;
  final IconData icon;

  const ArticleData({
    required this.title,
    required this.description,
    required this.category,
    this.externalUrl,
    required this.icon,
  });
}

class ArchitectureData {
  final String projectTitle;
  final String description;
  final List<String> keyPoints;
  final String? diagramUrl;

  const ArchitectureData({
    required this.projectTitle,
    required this.description,
    required this.keyPoints,
    this.diagramUrl,
  });
}

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    // SocialButtonData(
    //   tag: StringConst.FACEBOOK_URL,
    //   iconData: FontAwesomeIcons.facebook,
    //   url: StringConst.FACEBOOK_URL,
    // ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    // SocialButtonData(
    //   tag: StringConst.INSTAGRAM_URL,
    //   iconData: FontAwesomeIcons.instagram,
    //   url: StringConst.INSTAGRAM_URL,
    // ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
    //TODO
    // SocialButton2Data(
    //   title: StringConst.DRIBBLE,
    //   iconData: FontAwesomeIcons.dribbble,
    //   url: StringConst.DRIBBLE_URL,
    //   titleColor: AppColors.pink300,
    //   buttonColor: AppColors.pink300,
    //   iconColor: AppColors.white,
    // ),
    // SocialButton2Data(
    //   title: StringConst.INSTA,
    //   iconData: FontAwesomeIcons.instagram,
    //   url: StringConst.INSTAGRAM_URL,
    //   titleColor: AppColors.yellow300,
    //   buttonColor: AppColors.yellow300,
    //   iconColor: AppColors.white,
    // ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.SKILLS_1,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_4,
      level: 60,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_5,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_6,
      level: 70,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_7,
      level: 70,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_2,
      level: 40,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_3,
      level: 10,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_8,
      level: 10,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_9,
      level: 10,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      description: StringConst.SKILLS_1_DESC,
      iconData: FontAwesomeIcons.flutter,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      description: StringConst.SKILLS_2_DESC,
      iconData: Icons.pages_outlined,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      description: StringConst.SKILLS_3_DESC,
      iconData: FontAwesomeIcons.paintbrush,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.recordVinyl,
    ),
    SkillCardData(title: "", description: "", iconData: Icons.pages_outlined),
    SkillCardData(
      title: StringConst.SKILLS_6,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.android,
    ),
    SkillCardData(
        title: StringConst.SKILLS_8,
        description: "",
        iconData: FontAwesomeIcons.nodeJs),
    SkillCardData(
      title: StringConst.SKILLS_7,
      description: StringConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.appStoreIos,
    ),
    SkillCardData(
        title: StringConst.SKILLS_9,
        description: "",
        iconData: FontAwesomeIcons.java),
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 6, subtitle: StringConst.HAPPY_CLIENTS),
    StatItemData(value: 5, subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 23, subtitle: StringConst.INCREDIBLE_PROJECTS),
  ];

  static List<ProjectCategoryData> projectCategories = [
    ProjectCategoryData(
        title: StringConst.ALL, number: allProjects.length, isSelected: true),
    ProjectCategoryData(title: StringConst.WIOM, number: wiom.length),
    ProjectCategoryData(title: StringConst.REAL_SOL, number: realSol.length),
    ProjectCategoryData(title: StringConst.NEO_DOCS, number: neodocs.length),
    ProjectCategoryData(title: StringConst.GMAGICA, number: gmagica.length),
    ProjectCategoryData(
        title: StringConst.PERSONAL_PROJECTS, number: personalProjects.length),
    ProjectCategoryData(title: StringConst.OZI, number: ozi.length),
  ];

  static List<String> hobbies1 = [
    StringConst.HOBBY_1,
    StringConst.HOBBY_2,
    StringConst.HOBBY_3,
    StringConst.HOBBY_4,
    StringConst.HOBBY_5,
  ];
  static List<String> hobbies2 = [
    StringConst.HOBBY_6,
    StringConst.HOBBY_7,
    StringConst.HOBBY_8,
    StringConst.HOBBY_9,
    StringConst.HOBBY_10,
  ];

  static List<String> awards1 = [
    StringConst.AWARDS_1,
    StringConst.AWARDS_2,
    StringConst.AWARDS_3,
    StringConst.AWARDS_4,
    StringConst.AWARDS_5,
  ];
  static List<String> awards2 = [
    StringConst.AWARDS_6,
    StringConst.AWARDS_7,
    StringConst.AWARDS_8,
    StringConst.AWARDS_9,
    StringConst.AWARDS_10,
  ];
  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_1,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_01,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_2,
      title: StringConst.BLOG_TITLE_2,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_02,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_3,
      title: StringConst.BLOG_TITLE_3,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_03,
    ),
  ];

  static List<NimBusCardData> nimbusCardData = [
    NimBusCardData(
      title: StringConst.JOB_ROLE,
      subtitle: StringConst.MOBILE_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    NimBusCardData(
      title: StringConst.DESIGNER,
      subtitle: StringConst.DESIGNER_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    NimBusCardData(
      title: StringConst.FREELANCER,
      subtitle: StringConst.FREELANCER_DESC,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  // TODO: Add Phool Gobhi project showcase
  // static List<ProjectData> phoolGobhiShowcase = [
  //   ProjectData(
  //     title: "Phool Gobhi: Short-Form Video App",
  //     category: "Featured",
  //     projectCoverUrl: "assets/images/phool_gobhi_hero.png", // TODO: add hero image
  //     width: 1.0,
  //     link: "https://phoolgobi.com", // Update with actual link
  //   ),
  // ];

  static List<ProjectData> allProjects = [
    ProjectData(
      projectId: 'partner_v1',
      title: StringConst.PARTNER_WIOM_V1,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V1_LINK,
    ),
    ProjectData(
      projectId: 'partner_v2',
      title: StringConst.PARTNER_WIOM_V2,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE_V2,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V2_LINK,
    ),
    ProjectData(
      projectId: 'expert_app',
      title: StringConst.EXPERT_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_EXPERT_ONE,
      width: 0.225,
      link: StringConst.EXPERT_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_ZERO,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'lms_wiom',
      title: StringConst.LMS_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_LMS,
      width: 0.225,
      link: StringConst.LMS_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'programming_hub',
      title: StringConst.PROGRAMMING_HUB_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_PROGRAMMING_HUB_ONE,
      width: 0.2375,
      link: StringConst.PROGRAMMING_HUB_REAL_SOL_LINK,
    ),
    ProjectData(
      projectId: 'grateful_diary',
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_ZERO,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
    ProjectData(
      projectId: 'neodocs_kidney',
      title: StringConst.NEODOCS_KIDNEY_TEST,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_KIDNEY_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.NEODOCS_KIDNEY_TEST_LINK,
    ),
    ProjectData(
      projectId: 'pregafaith',
      title: StringConst.PREGAFAITH,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_PREGAFAITH_ONE,
      width: 0.475,
      mobileHeight: 0.3,
      link: StringConst.PREGAFAITH_LINK,
    ),
    ProjectData(
      projectId: 'moov_money',
      title: StringConst.MOOV_MONEY_TOGO,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_TOGO,
      width: 0.225,
      link: StringConst.MOOV_MONEY_TOGO_LINK,
    ),
    ProjectData(
      projectId: 'moov_money',
      title: StringConst.MOOV_MONEY_CI,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_CI,
      width: 0.225,
      link: StringConst.MOOV_MONEY_CI_LINK,
    ),
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      projectId: 'ozi_user_app',
      title: StringConst.OZI_USER_APP,
      category: StringConst.OZI,
      projectCoverUrl: ImagePath.OZI_USER_ONE,
      width: 0.3,
      mobileHeight: 0.3,
      link: StringConst.OZI_USER_APP_LINK,
    ),
  ];

  static List<ProjectData> wiom = [
    ProjectData(
      projectId: 'partner_v1',
      title: StringConst.PARTNER_WIOM_V1,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V1_LINK,
    ),
    ProjectData(
      projectId: 'partner_v1',
      title: StringConst.PARTNER_WIOM_V1,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_TWO,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V1_LINK,
    ),
    ProjectData(
      projectId: 'partner_v2',
      title: StringConst.PARTNER_WIOM_V2,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_ONE_V2,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V2_LINK,
    ),
    ProjectData(
      projectId: 'partner_v2',
      title: StringConst.PARTNER_WIOM_V2,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_PARTNER_TWO_V2,
      width: 0.225,
      link: StringConst.PARTNER_WIOM_V2_LINK,
    ),
    ProjectData(
      projectId: 'expert_app',
      title: StringConst.EXPERT_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_EXPERT_ZERO,
      width: 0.225,
      link: StringConst.EXPERT_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'expert_app',
      title: StringConst.EXPERT_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_EXPERT_ONE,
      width: 0.225,
      link: StringConst.EXPERT_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_ZERO,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_ONE,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_TWO,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_THREE,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_FOUR,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'customer_wiom',
      title: StringConst.CUSTOMER_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_CUSTOMER_FIVE,
      width: 0.225,
      link: StringConst.CUSTOMER_WIOM_LINK,
    ),
    ProjectData(
      projectId: 'lms_wiom',
      title: StringConst.LMS_WIOM,
      category: StringConst.WIOM,
      projectCoverUrl: ImagePath.WIOM_LMS,
      width: 0.225,
      link: StringConst.LMS_WIOM_LINK,
    ),
  ];

  static List<ProjectData> realSol = [
    ProjectData(
      projectId: 'programming_hub',
      title: StringConst.PROGRAMMING_HUB_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_PROGRAMMING_HUB_ZERO,
      width: 0.2375,
      link: StringConst.PROGRAMMING_HUB_REAL_SOL_LINK,
    ),
    ProjectData(
      projectId: 'programming_hub',
      title: StringConst.PROGRAMMING_HUB_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_PROGRAMMING_HUB_ONE,
      width: 0.2375,
      link: StringConst.PROGRAMMING_HUB_REAL_SOL_LINK,
    ),
    ProjectData(
      projectId: 'grateful_diary',
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_ZERO,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
    ProjectData(
      projectId: 'grateful_diary',
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_ONE,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
    ProjectData(
      projectId: 'grateful_diary',
      title: StringConst.GRATEFUL_DIARY_REAL_SOL,
      category: StringConst.REAL_SOL,
      projectCoverUrl: ImagePath.REAL_SOL_GRATEFUL_TWO,
      width: 0.2375,
      link: StringConst.GRATEFUL_DIARY_REAL_SOL_LINK,
    ),
  ];

  static List<ProjectData> neodocs = [
    ProjectData(
      projectId: 'neodocs_kidney',
      title: StringConst.NEODOCS_KIDNEY_TEST,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_KIDNEY_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.NEODOCS_KIDNEY_TEST_LINK,
    ),
    ProjectData(
      projectId: 'neodocs_kidney',
      title: StringConst.NEODOCS_KIDNEY_TEST,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_KIDNEY_TWO,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.NEODOCS_KIDNEY_TEST_LINK,
    ),
    ProjectData(
      projectId: 'pregafaith',
      title: StringConst.PREGAFAITH,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_PREGAFAITH_ZERO,
      width: 0.475,
      mobileHeight: 0.3,
      link: StringConst.PREGAFAITH_LINK,
    ),
    ProjectData(
      projectId: 'pregafaith',
      title: StringConst.PREGAFAITH,
      category: StringConst.NEO_DOCS,
      projectCoverUrl: ImagePath.NEODOCS_PREGAFAITH_ONE,
      width: 0.475,
      mobileHeight: 0.3,
      link: StringConst.PREGAFAITH_LINK,
    ),
    ProjectData(
        projectId: 'malaria_dengue',
        title: StringConst.INSTANT_MALARIA_DENGUE,
        category: StringConst.NEO_DOCS,
        projectCoverUrl: ImagePath.NEODOCS_MALARIA_ONE,
        width: 0.475,
        mobileHeight: 0.3,
        link: StringConst.INSTANT_MALARIA_DENGUE_LINK),
    ProjectData(
        projectId: 'malaria_dengue',
        title: StringConst.INSTANT_MALARIA_DENGUE,
        category: StringConst.NEO_DOCS,
        projectCoverUrl: ImagePath.NEODOCS_MALARIA_ZERO,
        width: 0.475,
        mobileHeight: 0.3,
        link: StringConst.INSTANT_MALARIA_DENGUE_LINK),
  ];

  static List<ProjectData> gmagica = [
    ProjectData(
      projectId: 'moov_money',
      title: StringConst.MOOV_MONEY_BENIN,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_TOGO,
      width: 0.225,
      link: StringConst.MOOV_MONEY_BENIN_LINK,
    ),
    ProjectData(
      projectId: 'moov_money',
      title: StringConst.MOOV_MONEY_TOGO,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_CI,
      width: 0.225,
      link: StringConst.MOOV_MONEY_TOGO_LINK,
    ),
    ProjectData(
      projectId: 'moov_money',
      title: StringConst.MOOV_MONEY_CI,
      category: StringConst.GMAGICA,
      projectCoverUrl: ImagePath.GMAGICA_MOOV_MONEY_TOGO,
      width: 0.225,
      link: StringConst.MOOV_MONEY_CI_LINK,
    ),
  ];

  static List<ProjectData> personalProjects = [
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_ZERO,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_ONE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_TWO,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_THREE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_FOUR,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    ),
    ProjectData(
      projectId: 'jammerz',
      title: StringConst.JAMMERZ,
      category: StringConst.PERSONAL_PROJECTS,
      projectCoverUrl: ImagePath.PERSONAL_PROJECTS_JAMMERZ_FIVE,
      width: 0.5,
      mobileHeight: 0.3,
      link: StringConst.JAMMERZ_LINK,
    )
  ];

  static List<ProjectData> ozi = [
    ProjectData(
      projectId: 'ozi_user_app',
      title: StringConst.OZI_USER_APP,
      category: StringConst.OZI,
      projectCoverUrl: ImagePath.OZI_USER_ONE,
      width: 0.3,
      mobileHeight: 0.3,
      link: StringConst.OZI_USER_APP_LINK,
    ),
    ProjectData(
      projectId: 'ozi_user_app',
      title: StringConst.OZI_USER_APP,
      category: StringConst.OZI,
      projectCoverUrl: ImagePath.OZI_USER_TWO,
      width: 0.3,
      mobileHeight: 0.3,
      link: StringConst.OZI_USER_APP_LINK,
    ),
    ProjectData(
      projectId: 'ozi_user_app',
      title: StringConst.OZI_USER_APP,
      category: StringConst.OZI,
      projectCoverUrl: ImagePath.OZI_USER_THREE,
      width: 0.3,
      mobileHeight: 0.3,
      link: StringConst.OZI_USER_APP_LINK,
    ),
  ];

  static const List<OziFeatureData> oziFeatures = [
    OziFeatureData(
      feature: "Android Cold Start Optimization",
      timeToDeliver: "1 week",
      quality: "620ms → 295ms (Firebase Performance verified)",
      impact: "52% faster launch — measured across 34K+ sessions",
    ),
    OziFeatureData(
      feature: "OOS (Out-of-Stock) Handling",
      timeToDeliver: "2 weeks",
      quality: "0 regressions shipped",
      impact:
          "Eliminated dead-end UX on stock-outs, protecting cart conversion",
    ),
    OziFeatureData(
      feature: "Free Gifts Feature",
      timeToDeliver: "2 weeks",
      quality: "70+ tests passing",
      impact: "Increased average order value — 25K+ orders/6 weeks",
    ),
    OziFeatureData(
      feature: "Scheduled Orders",
      timeToDeliver: "2 weeks",
      quality: "Crash-free on all new versions",
      impact: "Higher repeat-order rate from returning users",
    ),
    OziFeatureData(
      feature: "Deeplink System Overhaul",
      timeToDeliver: "1 week",
      quality: "Replaced 2s polling delay with event-driven signal",
      impact: "Faster campaign landing — lower drop-off from push/AppFlyer",
    ),
    OziFeatureData(
      feature: "HomeBloc Architecture Refactor",
      timeToDeliver: "3 weeks",
      quality: "81% code reduction, 0 regressions",
      impact: "3× faster feature iteration on home screen",
    ),
    OziFeatureData(
      feature: "Networking Layer Restructure",
      timeToDeliver: "2 weeks",
      quality: "179 files migrated, 0 regressions",
      impact: "10–20% fewer duplicate API calls, better offline resilience",
    ),
    OziFeatureData(
      feature: "App Stability Drive (lead initiative)",
      timeToDeliver: "4 months (ongoing)",
      quality: "New versions (v1.7+) essentially crash-free in production",
      impact: "4.2★ → 4.8★ Play Store rating; 173K MAU",
    ),
  ];

  // Featured: Current work
  static const String FEATURED = "Featured";
  static List<ProjectData> featured = [];

  // Detailed Project Information
  static Map<String, ProjectDetailData> projectDetails = {
    // WIOM Projects
    'partner_v1': ProjectDetailData(
      projectId: 'partner_v1',
      title: 'Wiom Partner V1',
      company: 'WIOM',
      shortDescription: 'A SAAS tool for internet providers without trust plan (PlayStore managed)',
      detailedDescription: 'Partner App V1 was designed for internet providers without a trust plan. This version was managed through the PlayStore and served as the foundation for partner management on the WIOM platform.',
      keyFeatures: [
        'Partner onboarding & profile management',
        'Ticket & task allocation system',
        'Performance analytics dashboard',
      ],
      impact: [
        'Reduced ticket hoarding by 75%',
        'Notification delivery rate: 50% → 96%',
        'Median ticket resolution time: 1.5 hours → 30 minutes',
      ],
      technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.i2e1.wiom.sales&hl=en_IN',
    ),
    'partner_v2': ProjectDetailData(
      projectId: 'partner_v2',
      title: 'Wiom Partner V2',
      company: 'WIOM',
      shortDescription: 'Enhanced partner app for internet providers with trust plan (direct distribution)',
      detailedDescription: 'V2 of the Partner App introduced advanced features for trust plan partners. This version used direct distribution and incorporated full-page notifications and improved ticket management systems.',
      keyFeatures: [
        'Full-page notifications system',
        'Advanced task allocation',
        'Real-time performance tracking',
        'Caching for low connectivity',
      ],
      impact: [
        'Ticket response time: 3 hours → 1 hour with full-page notifications',
        'Page load time: 20-25s → 1.5s (caching)',
        'Bugs per release: 250+ → 2+',
        'Crash-free users: 98.8%, ANR: 1.8%',
      ],
      technologies: ['Flutter', 'Dart', 'Hive (local storage)', 'Bloc/Cubit state management'],
      downloadLink: 'https://wiom-partner.s3.ap-south-1.amazonaws.com/Wiom-Partner.apk',
    ),
    'expert_app': ProjectDetailData(
      projectId: 'expert_app',
      title: 'Wiom Expert',
      company: 'WIOM',
      shortDescription: 'SAAS tool for employees/helpers managing partner/internet provider services',
      detailedDescription: 'Expert App is designed for field employees and helpers of partners and internet providers. It enables them to manage daily operations, handle customer interactions, and track performance metrics.',
      keyFeatures: [
        'Task management & routing',
        'Customer interaction tracking',
        'Performance metrics dashboard',
        'Offline mode support',
      ],
      impact: [
        'Crash-free users: 98%',
        'Session reliability: 99.6%',
        'Shared logic with Partner App for reduced maintenance',
      ],
      technologies: ['Flutter', 'Dart', 'Shared architecture with Partner App'],
      downloadLink: 'https://wiom-partner.s3.ap-south-1.amazonaws.com/Wiom-Expert.apk',
    ),
    'customer_wiom': ProjectDetailData(
      projectId: 'customer_wiom',
      title: 'Wiom Customer',
      company: 'WIOM',
      shortDescription: 'Universal app for customers to book installations, check feasibility, and manage recharges',
      detailedDescription: 'A comprehensive customer app enabling booking of wifi installations, checking installation feasibility, connecting to wifi, and handling recharges for both wifi and mobile services. Rebuilt entirely in 2 months with clean architecture.',
      keyFeatures: [
        'Installation booking system',
        'WiFi connectivity feasibility checker',
        'Integrated recharge system (WiFi & Mobile)',
        'Real-time installation tracking',
        'Low-connectivity support with caching',
      ],
      impact: [
        'Rebuilt in 2 months with clean architecture',
        'Google Places API cost reduction: ₹18 → ₹9 per customer (₹27 lakh/month savings)',
        'App launch time: 15s → 3s',
        'Crash-free users: 98.5%',
        'Session reliability: 99.5%',
        'In-app updates: 99.7% success rate',
        'ANR: 0.3%',
      ],
      technologies: ['Flutter', 'Dart', 'Clean Architecture', 'Hive', 'Firebase'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.i2e1.wiom_gold&hl=en_IN',
    ),
    'lms_wiom': ProjectDetailData(
      projectId: 'lms_wiom',
      title: 'WIOM LMS',
      company: 'WIOM',
      shortDescription: 'Learning Management System for BDOs to generate leads and bookings',
      detailedDescription: 'A dedicated LMS app for Business Development Officers (BDOs) designed to help generate leads and customer bookings through an organized learning and management platform.',
      keyFeatures: [
        'Lead generation tools',
        'Booking management system',
        'Performance analytics',
        'Training materials library',
      ],
      impact: [
        'Developed solo in 15 days under tight deadlines',
        'Zero user issues for 2K+ users',
        'Managed unstable APIs reliably',
      ],
      technologies: ['Flutter', 'Dart', 'API integration'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.i2e1.wiom.leads&hl=en_IN',
    ),

    // Real SOL Projects
    'programming_hub': ProjectDetailData(
      projectId: 'programming_hub',
      title: 'Programming Hub: Learn to Code',
      company: 'Real SOL',
      shortDescription: 'EdTech app teaching coding practices with multiple programming languages',
      detailedDescription: 'A comprehensive programming and coding learning app created in collaboration with Google experts. It teaches HTML, Javascript, C, C++, C#, Swift, Python, R, Java, AI, CSS and more through interactive lessons and practice problems.',
      keyFeatures: [
        'Multiple programming language courses',
        'Interactive code editor',
        'Real-time code execution',
        'Progressive learning path',
        'Offline content access',
      ],
      impact: [
        'Large user base for EdTech app',
        'Created with Google experts for best practices',
        'Game-like experience for engagement',
      ],
      technologies: ['Flutter', 'Dart', 'Code execution engines', 'Firebase'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.programming.hub',
      websiteLink: 'https://programming-hub.real-sol.com',
    ),
    'grateful_diary': ProjectDetailData(
      projectId: 'grateful_diary',
      title: 'Grateful Diary: Daily Journal with AI',
      company: 'Real SOL',
      shortDescription: 'AI-powered journaling app with ChatGPT integration and cloud backup',
      detailedDescription: 'A unique journaling experience where users can journal with real-time recommendations from a ChatGPT-integrated chatbot. Includes automated encrypted backups similar to WhatsApp for data security and restoration.',
      keyFeatures: [
        'AI-powered journaling recommendations',
        'ChatGPT integration',
        'Automated encrypted cloud backups',
        'Secure data restoration',
        'Private journal entries',
      ],
      impact: [
        'Novel AI-journaling experience',
        'WhatsApp-like backup reliability',
        'User retention through AI engagement',
      ],
      technologies: ['Flutter', 'Dart', 'ChatGPT API', 'Encryption', 'Cloud storage'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.grateful.diary',
    ),

    // Neodocs Projects
    'neodocs_kidney': ProjectDetailData(
      projectId: 'neodocs_kidney',
      title: 'Neodocs - ACR, GFR Kidney Test',
      company: 'Neodocs',
      shortDescription: 'Lab-quality kidney health monitoring with card-based rapid testing',
      detailedDescription: 'Transform kidney health monitoring with lab-quality results in 30 seconds. Users purchase a diagnostic card from Amazon or Tata 1MG, dip it in urine for 60 seconds, and the app uses advanced OCR and color recognition algorithms to analyze results.',
      keyFeatures: [
        'Rapid diagnostic card scanning',
        'Advanced OCR color recognition',
        'Algorithm-based result analysis',
        'Lab-quality accuracy',
        'Real-time result interpretation',
      ],
      impact: [
        'Lab-quality diagnostic results at home',
        'Fast 30-second analysis from card scanning',
        'Accessible kidney health monitoring',
      ],
      technologies: ['Flutter', 'Dart', 'Computer Vision/OCR', 'Image processing', 'Algorithm design'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.neodocs.kidney',
    ),
    'pregafaith': ProjectDetailData(
      projectId: 'pregafaith',
      title: 'Pregafaith - Pregnancy Testing & Guidance',
      company: 'Neodocs',
      shortDescription: 'Hero app with 5L+ downloads helping pregnancy result detection and counseling',
      detailedDescription: 'The flagship Neodocs app with 5L+ downloads and 10K+ downloads in the first two days. Detects pregnancy results, provides comprehensive counseling, and guides users. Engineered to support 4 different user types with different mindsets and motivations.',
      keyFeatures: [
        'Pregnancy result detection & interpretation',
        'Personalized counseling system',
        'Multi-user psychology-aware guidance',
        'Result history tracking',
        'Private consultation features',
      ],
      impact: [
        '5,00,000+ downloads',
        '10,000+ downloads in first 2 days',
        'Supports diverse user mindsets responsibly',
        'Critical health guidance app',
      ],
      technologies: ['Flutter', 'Dart', 'Image recognition', 'Psychology-aware UX design'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.neodocs.pregafaith',
    ),
    'malaria_dengue': ProjectDetailData(
      projectId: 'malaria_dengue',
      title: 'Instant Malaria & Dengue Test',
      company: 'Neodocs',
      shortDescription: 'Smartphone-based rapid malaria screening using AI and blood sample analysis',
      detailedDescription: 'Revolutionary app for instant malaria screening using only a smartphone camera. Employs AI algorithms to analyze a blood sample placed on a diagnostic strip, identifying and counting malaria parasites in real-time.',
      keyFeatures: [
        'Smartphone camera-based testing',
        'AI parasite detection & counting',
        'Instant results without lab visit',
        'Field deployment capability',
        'High accuracy detection',
      ],
      impact: [
        'Enables rapid malaria screening in remote areas',
        'AI-powered accuracy without traditional labs',
        'Critical for disease detection & prevention',
      ],
      technologies: ['Flutter', 'Dart', 'Computer Vision/AI', 'Image processing', 'Machine learning'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.neodocs.malaria',
    ),

    // Gmagica Projects
    'moov_money': ProjectDetailData(
      projectId: 'moov_money',
      title: 'MOOV MONEY - Payment Gateway',
      company: 'Gmagica',
      shortDescription: 'Mobile payment gateway for developing countries with region-specific versions',
      detailedDescription: 'A comprehensive payment gateway app similar to Paytm, enabling users to pay bills, rent, book transportation, and manage finances. Built with different versions for developing countries: Benin, CI (Côte d\'Ivoire), and Togo.',
      keyFeatures: [
        'Rent and bill payment',
        'Electricity bill payments',
        'Parking fee management',
        'Bus, train, and flight bookings',
        'Multi-country support',
        'Secure payment processing',
      ],
      impact: [
        'Regional expansion across Africa',
        'Supports multiple countries: Benin, CI, Togo',
        'Accessible payment solutions for emerging markets',
      ],
      technologies: ['Flutter', 'Dart', 'Payment gateway integration', 'Multi-currency support'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.gmagica.moov',
    ),

    // Personal Projects
    'jammerz': ProjectDetailData(
      projectId: 'jammerz',
      title: 'Jammerz: Music Streaming App',
      company: 'Personal Project',
      shortDescription: 'Personal practice project for online music streaming and playlist management',
      detailedDescription: 'A learning project to master music streaming functionality. Users can stream music online, favorite tracks, and maintain personalized playlists. Showcases proficiency with audio handling and user preference management.',
      keyFeatures: [
        'Online music streaming',
        'Favorite/bookmark tracks',
        'Playlist management',
        'Playback controls',
        'Search functionality',
      ],
      impact: [
        'Demonstrates music streaming architecture',
        'Portfolio piece for audio handling expertise',
        'Clean code and UX patterns',
      ],
      technologies: ['Flutter', 'Dart', 'Audio streaming', 'Local storage'],
      websiteLink: 'https://jammerz.dev',
    ),

    // OZI Project (Current)
    'ozi_user_app': ProjectDetailData(
      projectId: 'ozi_user_app',
      title: 'OZi User App',
      company: 'OZi (Current)',
      shortDescription: 'Leading quick-commerce app from 4.2★ to 4.8★ with 99.8% crash-free sessions',
      detailedDescription: 'As Mobile Engineering Lead at OZi, led a team of 5 to transform the app. Drove 1,237+ commits in 4 months, architected major refactors, implemented critical performance optimizations, and established stability frameworks. The app serves 173K MAU with consistently high performance.',
      keyFeatures: [
        'Order booking and tracking',
        'Real-time delivery tracking',
        'Smart recommendation engine',
        'Offline order history',
        'Push notification system',
        'Scheduled order capabilities',
      ],
      impact: [
        'App rating: 4.2★ → 4.8★ Play Store',
        'Crash-free users: 99.8%',
        'Monthly Active Users: 173K+',
        'Cold start optimization: 52% faster (620ms → 295ms)',
        'Deeplink system overhaul: event-driven vs polling',
        'Android stability drive lead',
        '1,237+ commits in 4 months',
      ],
      technologies: ['Flutter', 'Dart', 'Bloc architecture', 'Firebase Performance', 'Advanced state management'],
      downloadLink: 'https://play.google.com/store/apps/details?id=com.ozi.user',
    ),
  };

  // Helper function to get project details by ID
  static ProjectDetailData? getProjectDetails(String projectId) {
    return projectDetails[projectId];
  }

  static List<TestimonialData> testimonials = [
    TestimonialData(
      name: 'Prateek Suraj',
      role: 'Head of Engineering',
      company: 'OZi',
      quote: 'Rohitashwa led the team to 99.8% crash-free sessions and a 4.8★ rating. His architecture decisions scaled beautifully, and his mentorship elevated the entire team.',
    ),
    TestimonialData(
      name: 'Saurabh Goyal',
      role: 'Engineering Manager',
      company: 'Wiom',
      quote: 'Exceptional at shipping high-quality features under pressure. Rohitashwa balances speed with careful architecture—rare combination.',
    ),
    TestimonialData(
      name: 'Satyam Darmora',
      role: 'CEO/Founder',
      company: 'Wiom',
      quote: 'Brought a sense of craftsmanship to the codebase. Not just a developer—a systems thinker who asks the right questions.',
    ),
  ];

  static List<ArticleData> articles = [
    // ArticleData(
    //   title: 'Scaling to 99.8% Crash-Free Sessions',
    //   description: 'Deep dive into how we built stability frameworks, memory optimization, and crash reporting at OZi.\n\nPublished: Feb 2026',
    //   category: 'Architecture',
    //   externalUrl: 'https://medium.com/@rohitashwa',
    //   icon: Icons.trending_up,
    // ),
    ArticleData(
      title: 'Performance Optimization at Scale - from 3.139s to 0.785s ',
      description: 'Techniques for reducing app startup time from 3.139s to 0.785s and managing memory in high-traffic apps.',
      category: 'Performance',
      externalUrl: 'https://medium.com/@rohitashwaofficial/from-3-139ms-to-785ms-all-native-experience-9f206955823d?postPublishedType=initial',
      icon: Icons.flash_on,
    ),
    // ArticleData(
    //   title: 'Team Scaling Strategies for Mobile',
    //   description: 'Leading a 5-person team through rapid feature delivery without sacrificing code quality.\n\nComing: Apr 2026',
    //   category: 'Leadership',
    //   externalUrl: 'https://medium.com/@rohitashwa',
    //   icon: Icons.people,
    // ),
  ];

  static List<ArchitectureData> architectureShowcases = [
    ArchitectureData(
      projectTitle: 'OZi – Multi-Cubit BLoC Pattern',
      description: 'Decomposed monolithic 2000+ line HomeBloc into 5 focused, reusable cubits. Reduced complexity by 81% while maintaining backward compatibility.',
      keyPoints: [
        'HomeCategoryCubit – category tab state',
        'HomeComponentCubit – dynamic feed pagination',
        'HomeThemeCubit – theme & background caching',
        'HomeAppBarCubit – search state management',
        'Stateless repository layer',
        '',
        'Data Flow:',
        '  API → Repository → Cubits → BlocBuilder → UI',
        '  Events fired in sequence (no cross-cubit reads)',
      ],
      diagramUrl: null,
    ),
    ArchitectureData(
      projectTitle: 'Cart Architecture – Clean Separation',
      description: 'Eliminated stateful repositories, consolidated duplicate API calls, removed dead code. Repository pattern fully stateless.',
      keyPoints: [
        'CartBloc owns all session state',
        'Repository is data layer only',
        'Single source of truth per domain',
        'Eliminated PaymentSummaryFetcher duplication',
        'Consolidated debounce logic',
        '',
        'Layer Design:',
        '  UI ← CartBloc ← Repository ← API',
        '  Each layer has one responsibility',
      ],
      diagramUrl: null,
    ),
    ArchitectureData(
      projectTitle: 'Performance-First Architecture',
      description: 'Every architectural decision made with memory, CPU, and user experience in mind. Achieves 52% faster cold starts.',
      keyPoints: [
        'Lazy-loaded feature cubits',
        'RepaintBoundary at correct nesting levels',
        'buildWhen for precise rebuilds',
        'Memory-efficient state objects',
        'Firebase monitoring integration',
        '',
        'Optimization Stack:',
        '  Code Splitting → Lazy Loading → Precise Rebuilds',
        '  Result: 620ms → 295ms cold start (52% faster)',
      ],
      diagramUrl: null,
    ),
  ];
}
