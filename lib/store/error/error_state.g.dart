// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorState> _$errorStateSerializer = new _$ErrorStateSerializer();

class _$ErrorStateSerializer implements StructuredSerializer<ErrorState> {
  @override
  final Iterable<Type> types = const [ErrorState, _$ErrorState];
  @override
  final String wireName = 'ErrorState';

  @override
  Iterable<Object> serialize(Serializers serializers, ErrorState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isDismissed',
      serializers.serialize(object.isDismissed,
          specifiedType: const FullType(bool)),
    ];
    if (object.exception != null) {
      result
        ..add('exception')
        ..add(serializers.serialize(object.exception,
            specifiedType: const FullType(Exception)));
    }
    return result;
  }

  @override
  ErrorState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'exception':
          result.exception = serializers.deserialize(value,
              specifiedType: const FullType(Exception)) as Exception;
          break;
        case 'isDismissed':
          result.isDismissed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorState extends ErrorState {
  @override
  final Exception exception;
  @override
  final bool isDismissed;

  factory _$ErrorState([void Function(ErrorStateBuilder) updates]) =>
      (new ErrorStateBuilder()..update(updates)).build();

  _$ErrorState._({this.exception, this.isDismissed}) : super._() {
    if (isDismissed == null) {
      throw new BuiltValueNullFieldError('ErrorState', 'isDismissed');
    }
  }

  @override
  ErrorState rebuild(void Function(ErrorStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorStateBuilder toBuilder() => new ErrorStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorState &&
        exception == other.exception &&
        isDismissed == other.isDismissed;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, exception.hashCode), isDismissed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorState')
          ..add('exception', exception)
          ..add('isDismissed', isDismissed))
        .toString();
  }
}

class ErrorStateBuilder implements Builder<ErrorState, ErrorStateBuilder> {
  _$ErrorState _$v;

  Exception _exception;
  Exception get exception => _$this._exception;
  set exception(Exception exception) => _$this._exception = exception;

  bool _isDismissed;
  bool get isDismissed => _$this._isDismissed;
  set isDismissed(bool isDismissed) => _$this._isDismissed = isDismissed;

  ErrorStateBuilder();

  ErrorStateBuilder get _$this {
    if (_$v != null) {
      _exception = _$v.exception;
      _isDismissed = _$v.isDismissed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ErrorState;
  }

  @override
  void update(void Function(ErrorStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorState build() {
    final _$result = _$v ??
        new _$ErrorState._(exception: exception, isDismissed: isDismissed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
