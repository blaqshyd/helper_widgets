//     bool isLoading = false; // Track loading state
//     final currentPage = ref.read(paginationProvider);
//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollInfo) {
//         if (scrollInfo is ScrollEndNotification &&
//             scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
//           isLoading = true;
//           currentPage.incrementPage();
//           ref.read(postsProvider(currentPage.state));
//         }

//         return false;
//       },