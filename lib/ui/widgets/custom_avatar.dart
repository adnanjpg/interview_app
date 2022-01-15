import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/providers/connectivity_prov.dart';

class CustomAvatar extends ConsumerWidget {
  final String? imageUrl;
  final Size size;
  const CustomAvatar(this.imageUrl, {this.size = const Size(40, 40), Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connected = ref.watch(connectionProvider);

    final errorClr = Theme.of(context).colorScheme.primary;

    return Builder(
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Builder(
              builder: (context) {
                if (imageUrl == null ||

                        // TODO: for now we're not checking if the image is cached,
                        // we should check for the cache and load accordingly later.
                        !connected
                    //
                    ) {
                  return Container(color: errorClr);
                }
                return CachedNetworkImage(
                  imageUrl: imageUrl!,
                  placeholder: (context, url) => Container(color: errorClr),
                  errorWidget: (context, url, error) {
                    return Container(color: errorClr);
                  },
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CustomImageLoader extends ConsumerWidget {
  final String? imageUrl;
  const CustomImageLoader(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connected = ref.watch(connectionProvider);

    final errorClr = Theme.of(context).colorScheme.secondary;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Builder(
        builder: (context) {
          if (imageUrl == null ||

                  // TODO: for now we're not checking if the image is cached,
                  // we should check for the cache and load accordingly later.
                  !connected
              //
              ) {
            return Container(color: errorClr);
          }

          return CachedNetworkImage(
            imageUrl: imageUrl!,
            errorWidget: (context, url, error) => Container(color: errorClr),
          );
        },
      ),
    );
  }
}
