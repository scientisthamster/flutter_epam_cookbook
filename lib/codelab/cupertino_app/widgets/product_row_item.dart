import 'package:flutter/cupertino.dart';
import 'package:flutter_epam_cookbook/codelab/cupertino_app/model/app_state_model.dart';
import 'package:flutter_epam_cookbook/codelab/cupertino_app/model/product.dart';
import 'package:flutter_epam_cookbook/codelab/cupertino_app/styles.dart';
import 'package:provider/provider.dart';

class ProductRowItem extends StatelessWidget {
  const ProductRowItem({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 0,
        right: 0,
      ),
      child: CupertinoListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.asset(
            product.assetName,
            package: product.assetPackage,
            fit: BoxFit.cover,
            width: 68.0,
            height: 68.0,
          ),
        ),
        leadingSize: 68.0,
        title: Text(
          product.name,
          style: Styles.productRowItemName,
        ),
        subtitle: Text(
          '\$${product.price}',
          style: Styles.productRowItemPrice,
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            final model = Provider.of<AppStateModel>(context, listen: false);
            model.addProductToCart(product.id);
          },
          child: const Icon(
            CupertinoIcons.plus_circled,
            semanticLabel: 'Add',
          ),
        ),
      ),
    );
  }
}
