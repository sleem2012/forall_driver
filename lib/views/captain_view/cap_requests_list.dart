import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_bloc.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_state.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/captain_view/widgets/cap_tile.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';

class InDriverRequestsList extends StatelessWidget {
  const InDriverRequestsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetInDriveBloc, GetInDriveState>(
      listener: (context, state) {
        state.whenOrNull(
          initial: (data) {
            if (data.state == KSlugModel.canceled) {
              GetInDriveBloc.of(context).removeLocal(id: data.id ?? 0, data: data);
            }
          },
        );
      },
      builder: (context, state) {
        final data = GetInDriveBloc.of(context);
        final filteredData = data.filterList();
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const KAppBar(),
          body: BgImg(
            child: Padding(
              padding: const EdgeInsets.all(KHelper.hPadding),
              child: RefreshIndicator(
                onRefresh: () async {
                  await GetInDriveBloc.of(context).get();
                },
                child: KRequestOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  error: state.whenOrNull(error: (error) => error),
                  onTryAgain: () => GetInDriveBloc.of(context).get,
                  child: (filteredData ?? []).isEmpty
                      ? ListView(
                          shrinkWrap: true,
                          children: [
                            Center(child: Text(Tr.get.no_request_yet)),
                            const SizedBox(height: 10),
                            SvgPicture.asset("assets/images/No Requests.svg"),
                          ],
                        )
                      : ListView.separated(
                          itemBuilder: (context, i) => CapTile(data: (filteredData ?? [])[i]),
                          separatorBuilder: (context, i) => const SizedBox(height: 10),
                          itemCount: (filteredData ?? []).length),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
