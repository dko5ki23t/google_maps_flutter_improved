// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart' show immutable;

import 'types.dart';

/// Uniquely identifies a [PointOfInterest] among [GoogleMap] POIs.
@immutable
class PointOfInterestId extends MapsObjectId<PointOfInterest> {
  /// Creates an immutable identifier for a [PointOfInterest].
  const PointOfInterestId(super.value);
}

/// A pair of latitude and longitude coordinates, stored as degrees.
@immutable
class PointOfInterest implements MapsObject<PointOfInterest> {
  /// Creates a PointOfInterest.
  const PointOfInterest({
    required this.placeId,
    this.name = '',
    this.position = const LatLng(0.0, 0.0),
  });

  /// The placeId of the POI.
  final PointOfInterestId placeId;

  @override
  PointOfInterestId get mapsId => placeId;

  /// The location of the POI.
  final LatLng position;

  /// The human-readable name of the POI as displayed on the map.
  final String name;

  /// Creates a new [PointOfInterest] object whose values are the same as this instance,
  /// unless overwritten by the specified parameters.
  PointOfInterest copyWith({
    PointOfInterestId? placeId,
    LatLng? position,
    String? name,
  }) {
    return PointOfInterest(
      placeId: placeId ?? this.placeId,
      position: position ?? this.position,
      name: name ?? this.name,
    );
  }

  /// Creates a new [PointOfInterest] object whose values are the same as this instance.
  @override
  PointOfInterest clone() => copyWith();

  /// Converts this object to something serializable in JSON.
  @override
  Object toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('placeId', placeId.value);
    addIfPresent('position', position.toJson());
    addIfPresent('name', name);
    return json;
  }

  @override
  String toString() =>
      'Marker(position: $position, name: $name, placeId: $placeId)';
}
