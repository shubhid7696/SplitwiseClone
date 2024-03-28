part of '../onBoarding_screen.dart';

Widget _page({
  required PageController controller,
  required pageIndex,
  required imageUrl,
  required title,
  required desc,
  required BuildContext context,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        imageUrl,
      ),
      const SizedBox(height: 40),
      Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Text(
          desc,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      const SizedBox(height: 120),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: pageIndex == 2
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: pageIndex !=
                  2, // don't show on page with index 2 (last page)
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Login();
                  }));
                },
                child: Text(
                  'Skip',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}