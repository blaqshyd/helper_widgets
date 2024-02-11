// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:helper/core/extensions/extensions.dart';
import 'package:helper/modules/anylink_prew.dart';
import 'package:helper/modules/calendar/calendar_screen.dart';
import 'package:helper/modules/chips/choice_chip_sc.dart';
// import 'package:helper/src/chips/filter_chip_sc.dart';
// import 'package:helper/src/chips/raw_chip_sc.dart';
// import 'package:helper/src/chips/chip_screen.dart';
import 'package:helper/modules/clipboard/clipboard_demo.dart';
import 'package:helper/modules/custom_keyboard/keypad.dart';
import 'package:helper/modules/custom_scaffold/app_scaffold.dart';
import 'package:helper/modules/custom_stepper/custom_stepper.dart';
import 'package:helper/modules/debouncers/debounce_btns.dart';
import 'package:helper/modules/debouncers/debounce_field.dart';
import 'package:helper/modules/dialogs/custom_dialogs.dart';
import 'package:helper/modules/dismissible/dismissible.dart';
import 'package:helper/modules/double_scrolls/double_scrolls.dart';
import 'package:helper/modules/dropdown/dropdown_btn.dart';
import 'package:helper/modules/expansion_tiles/expansion_tiles.dart';
import 'package:helper/modules/full_preview_image/image_preview_screen.dart';
import 'package:helper/modules/gridview_posts/gridview_network.dart';
import 'package:helper/modules/gridview_posts/gridview_pick.dart';
import 'package:helper/modules/grouped_list/grouped_list_view.dart';
import 'package:helper/modules/insta_profile/insta_profile.dart';
import 'package:helper/modules/leaderbord/leader_board.dart';
import 'package:helper/modules/life_cycle/life_cycle_watcher.dart';
import 'package:helper/modules/linkify/text_linkify.dart';
import 'package:helper/modules/list_card/the_list_card.dart';
import 'package:helper/modules/nav_with_indexed_stack/indexed_stack_nav.dart';
import 'package:helper/modules/nav_with_indexed_stack/navigation_with_indexed.dart';
import 'package:helper/modules/overlapped_avatars/overlapped.dart';
import 'package:helper/modules/overlapped_avatars/overlapped_avatars.dart';
import 'package:helper/modules/reset_timer_counter/reset_timer.dart';
import 'package:helper/modules/sample_screen/sample.dart';
import 'package:helper/modules/search_filter/custom_search.dart';
import 'package:helper/modules/slider/slider_box.dart';
import 'package:helper/modules/tab_bar_scroll/tab_bar_scroll.dart';
import 'package:helper/modules/text_formatters/text_formats.dart';
import 'package:helper/modules/text_overflow/text_overflow_screen.dart';
import 'package:helper/modules/validators_auth/sign_up.dart';
import 'package:helper/modules/widgets/grid_view_mod.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Helper Widgets'.txt(fontSize: 23),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: screens.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final screen = screens[index];
                return ListTile(
                  onTap: () => push(screen.child),
                  title: Text(screen.title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Screens {
  final String title;
  final Widget child;
  Screens({
    required this.title,
    required this.child,
  });
}

final List<Screens> screens = [
  Screens(title: 'AnyLink Preview', child: const AnylinkPrew()),
  Screens(title: 'Calendar', child: const CalendarScreen()),
  Screens(title: 'ClipBoard', child: const ClipboardDemo()),
  // Screens(title: 'Custom Paint', child: const CommentPainter()),
  // Screens(title: 'Chat Bubble', child: const ChatBubble()),
  Screens(title: 'Custom Dialogs', child: const CustomDialogs()),
  Screens(title: 'Custom Keyboard', child: const Keypad()),
  Screens(title: 'Custom Search', child: const CustomSearch()),
  Screens(title: 'Custom Stepper', child: const CustomStepper()),

  Screens(title: 'Chips', child: const ChoiceChipScreen()),
  Screens(title: 'Dismissible', child: const DismissibleWidget()),
  Screens(title: 'Drop Down', child: const DropdownBtn()),
  Screens(title: 'Debounce Search field', child: const DebouncedSearchField()),
  Screens(title: 'Debounce Buttons', child: const Debouncers()),
  Screens(title: 'Double Scrolls', child: const DoubleScrolls()),
  Screens(title: 'Expansion Tiles', child: const ExpansionTilesW()),
  Screens(title: 'GridView Pick', child: const GridViewPick()),
  Screens(title: 'GridView Network', child: const GridViewNetwork()),
  Screens(title: 'GridView Mod', child: const GridViewMod()),
  Screens(title: 'Grouped List', child: const GroupedListView()),
  Screens(title: 'Full Image Preview', child: const FullImagePreview()),
  Screens(title: 'Indexed Stack Nav', child: const IndexedStackNav()),
  Screens(title: 'LeaderBoard', child: const LeaderBoard()),
  Screens(title: 'List Cards', child: const TheListCard()),
  Screens(title: 'LifecycleWatcher', child: const LifecycleWatcher()),
  Screens(title: 'Nav with Indexed', child: const NavWithIndexed()),
  Screens(title: 'Overlapped Avatars', child: OverlappedAvatar()),
  Screens(title: 'Overlapped Avatars 2', child: Overlapped()),
  Screens(title: 'Profile', child: const InstaProfile()),
  Screens(title: 'Reset Timer with Tween', child: const ResetTimer()),
  Screens(title: 'Sample Screen', child: const SampleScreen()),
  Screens(title: 'Slider Box', child: const SliderBox()),
  Screens(title: 'Tab Bar Scroll', child: const TabBarScroll()),
  Screens(title: 'Text Formatters', child: const TextFormats()),
  Screens(title: 'Text Linkify', child: const LinkifyExample()),
  Screens(title: 'Text Overflow', child: const OverflowTextS()),
  Screens(title: 'Validators', child: const AuthScreens()),
];
