class CruiseDestination {
  final String title;
  final String location;
  final String imageUrl;
  final String portraitBannerText;
  final String landscapeBannerText;
  final String description;
  final int initialRating;
  final List<String> packages;

  const CruiseDestination({
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.portraitBannerText,
    required this.landscapeBannerText,
    required this.description,
    required this.initialRating,
    required this.packages,
  });

  static const CruiseDestination rajangCruise = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/0/09/Sibu_Wharf.jpg',
    portraitBannerText: 'Sibu Esplanade Landmark',
    landscapeBannerText: 'Rajang River Horizon',
    description:
    "Experience the heart of Sibu along Malaysia's longest river, the Rajang. "
        'Cruise past historic temples, timber hubs, and traditional waterfront '
        'settlements while experiencing authentic Sarawakian hospitality.',
    initialRating: 43,
    packages: [
      'Private River Cruise',
      'Sunset Cruise',
      'Sunrise Cruise',
      'Rural Cruise',
      'SMI Park Cruise',
    ],
  );
}